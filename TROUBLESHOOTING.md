# TMUX Configuration Troubleshooting Guide

## Recent Fixes Applied (2025-07-04)

### Issue: Missing Theme and Status Bar Components

**Problem:** After modularizing the TMUX configuration, the theme was not loading and status bar showed no hostname, username, or date information.

**Root Causes:**
1. **Missing theme configuration** - The modular setup removed all theme/status bar configs
2. **Broken scripts** - username/hostname scripts were calling undefined helper functions
3. **Configuration errors** - init.conf was calling missing `_apply_configuration` function

**Solutions Applied:**

#### 1. Created `conf/theme.conf` Module
- Restored theme colors from original comprehensive configuration
- Added complete status bar setup with proper styling
- Configured status-left and status-right with battery, time, date, user, hostname

#### 2. Simplified System Scripts
**Before (broken):**
```bash
# Scripts called undefined functions like _pane_info, _ssh_or_mosh_args, _is_true
pane_info=$(_pane_info "$pane_pid" "$pane_tty")  # FAILED
```

**After (working):**
```bash
# username script
username=$(whoami)
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # Handle SSH sessions appropriately
fi

# hostname script  
hostname=$(hostname -s 2>/dev/null || hostname)
```

#### 3. Fixed Battery Script
- Added missing `_uname_s=$(uname -s)` variable
- Added default charging/discharging symbols
- Script now handles missing battery gracefully (desktop systems)

#### 4. Updated Main Configuration
- Added `source-file ~/dotfile-tmux/conf/theme.conf` to main .tmux.conf
- Removed problematic `_apply_configuration` call from init.conf
- Configuration now loads without errors

#### 5. Enhanced Setup Script Debugging
Added comprehensive verification in setup script:
```bash
# Verify theme configuration
if [ -f "$TMUX_DOTFILES_DIR/conf/theme.conf" ]; then
    print_debug "theme.conf found"
fi

# Verify battery scripts
if [ -x "$TMUX_DOTFILES_DIR/scripts/battery/battery-status" ]; then
    print_debug "battery-status script is executable"
fi
```

### Testing and Verification

**Debug Script Created:** `~/dotfile-tmux/debug-status.sh`
- Tests all status bar components individually
- Verifies script execution and output
- Provides clear instructions for users

**Results:**
- ✅ Theme colors working (dark gray background, colored highlights)
- ✅ Status bar components: session name, time, date, username, hostname
- ✅ Configuration loads without errors
- ✅ Scripts execute successfully

**Example Working Status Bar:**
```
❐ 0  20:41  04 Jul | jvian | nova
```

### Files Modified
- `/home/jvian/dotfile-tmux/.tmux.conf` - Added theme.conf source
- `/home/jvian/dotfile-tmux/conf/theme.conf` - **NEW** Complete theme configuration
- `/home/jvian/dotfile-tmux/conf/init.conf` - Removed broken _apply_configuration call
- `/home/jvian/dotfile-tmux/scripts/system/username` - Simplified implementation
- `/home/jvian/dotfile-tmux/scripts/system/hostname` - Simplified implementation  
- `/home/jvian/dotfile-tmux/scripts/battery/battery-status` - Fixed missing variable
- `/home/jvian/dotfiles/setup` - Enhanced debugging and verification
- `/home/jvian/dotfile-tmux/debug-status.sh` - **NEW** Comprehensive debug script

### Configuration Architecture

The modular TMUX configuration now consists of:
```
~/dotfile-tmux/
├── .tmux.conf              # Main config that sources modules
├── conf/
│   ├── general.conf        # Basic TMUX settings
│   ├── display.conf        # Display and window settings  
│   ├── navigation.conf     # Key bindings and navigation
│   ├── copy-mode.conf      # Copy mode configuration
│   ├── theme.conf          # Theme colors and status bar ⭐ NEW
│   └── init.conf           # Initialization (cleaned up)
└── scripts/
    ├── battery/
    │   └── battery-status   # Battery information (fixed)
    └── system/
        ├── username         # Username detection (simplified)
        └── hostname         # Hostname detection (simplified)
```

## Mouse Functionality Issue (2025-07-04)

### Issue: Mouse Not Working After Configuration Changes

**Problem:** Mouse functionality was disabled after the modular configuration setup.

**Root Cause:** The `set -g mouse on` setting was not explicitly configured in the modular setup.

**Solution Applied:**

#### 1. Added Mouse Configuration
- Added `set -g mouse on` to `/home/jvian/dotfile-tmux/conf/general.conf`
- Ensured mouse is enabled by default in all new sessions

#### 2. Verified Toggle Functionality  
- Toggle script `/home/jvian/dotfile-tmux/scripts/utils/toggle-mouse` working correctly
- Key binding `Prefix + m` toggles mouse on/off as expected

#### 3. Created Mouse Test Script
**Test Script:** `~/dotfile-tmux/test-mouse.sh`
- Verifies mouse setting status
- Tests toggle functionality
- Provides troubleshooting guidance
- Lists expected mouse behaviors

**Expected Mouse Features:**
- ✅ Click to focus panes and windows
- ✅ Drag borders to resize panes  
- ✅ Scroll to navigate history
- ✅ Double-click to select words
- ✅ Toggle with `Prefix + m`
- ✅ Visual indicator in status bar (↗ when enabled)
- ✅ Display messages when toggling

#### 4. Added Mouse Indicator to Status Bar
**Problem:** Missing visual mouse indicator that was in original configuration.

**Solution Applied:**
- Added mouse indicator symbol `↗` (U+2197) to theme configuration
- Added prefix indicator symbol `⌨` (U+2328) for completeness  
- Updated status-right to include both indicators before other content
- Indicators are colored: mouse (blue), prefix (yellow)

**Status Bar Indicators:**
- `⌨` (Yellow) - Shows when prefix key is pressed
- `↗` (Blue) - Shows when mouse mode is enabled (disappears when disabled)

**Enhanced Toggle Script:**
- Added display messages when toggling: "↗ Mouse mode: ON" / "🚫 Mouse mode: OFF"
- Messages appear for 2 seconds when using `Prefix + m`

**Status Bar Layout:**
```
[⌨][↗] battery time date | username | hostname
```

**Troubleshooting Notes:**
- Mouse functionality depends on terminal emulator support
- Some terminals may need specific mouse settings enabled
- TMUX version: `tmux next-3.6`
- Mouse indicator appears/disappears dynamically based on mouse setting

### Future Maintenance

**To update theme colors:** Edit `/home/jvian/dotfile-tmux/conf/theme.conf`
**To modify status bar:** Update `status-left` and `status-right` in theme.conf
**To test status bar:** Run `~/dotfile-tmux/debug-status.sh`
**To test mouse functionality:** Run `~/dotfile-tmux/test-mouse.sh`
**To test mouse indicator:** Run `~/dotfile-tmux/test-mouse-indicator.sh`
**To reload config:** `tmux source-file ~/.tmux.conf`

### Test Scripts Available
- `~/dotfile-tmux/debug-status.sh` - Comprehensive status bar component testing
- `~/dotfile-tmux/test-mouse.sh` - Basic mouse functionality verification
- `~/dotfile-tmux/test-mouse-indicator.sh` - Mouse indicator and toggle testing