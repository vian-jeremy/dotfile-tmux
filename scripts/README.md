# Tmux Modular Scripts

This directory contains extracted shell scripts that were previously embedded within the main tmux configuration file. This modular approach makes the code easier to maintain, debug, and extend.

## Directory Structure

### 📁 utils/
Utility scripts for tmux operations:
- **maximize-pane** - Maximize/restore pane functionality (`<prefix>+`)
- **toggle-mouse** - Toggle mouse mode on/off (`<prefix>m`)

### 📁 tools/
External tool integrations:
- **fpp** - Facebook PathPicker integration (`<prefix>F`)

### 📁 battery/
Battery status and monitoring scripts:
- **battery-info** - Get battery percentage and status
- **battery-status** - Get battery charging/discharging state

### 📁 system/
System information scripts:
- **username** - Get current or SSH username
- **hostname** - Get current or SSH hostname

### 📁 config/
Configuration management scripts:
- **apply-configuration** - Main configuration application (complex, still embedded)

### 📁 theme/
Theme and status bar scripts (to be implemented)

## Usage

Scripts are called directly from tmux key bindings in the configuration files:

```tmux
# Instead of: bind + run "cut -c3- '#{TMUX_CONF}' | sh -s _maximize_pane '#{session_name}' '#D'"
# Now: bind + run "~/dotfile-tmux/scripts/utils/maximize-pane '#{session_name}' '#D'"
```

## Benefits

1. **Easier Debugging** - Scripts can be tested independently
2. **Better Organization** - Related functionality grouped together
3. **Improved Maintenance** - Edit individual scripts without touching main config
4. **Standalone Testing** - Scripts can be executed directly for testing
5. **Version Control** - Better tracking of changes to individual components

## Adding New Scripts

1. Create script in appropriate category directory
2. Add shebang line: `#!/bin/sh`
3. Make executable: `chmod +x script-name`
4. Update tmux configuration to call the script
5. Test functionality

## Migration Status

✅ **Completed:**
- Basic utility scripts (maximize-pane, toggle-mouse)
- Tool integrations (fpp)
- System info scripts (username, hostname)
- Battery monitoring scripts

🔄 **In Progress:**
- Complex configuration scripts (apply-configuration, theme functions)
- URL handling scripts (urlview, urlscan)

## Notes

- All scripts maintain compatibility with the original Oh My Tmux! functionality
- Scripts use the same environment variables and tmux integration patterns
- Original embedded functions remain as fallback in main configuration