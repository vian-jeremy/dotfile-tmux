# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal tmux configuration repository based on the "Oh my tmux!" framework by Gregory Pakosz. It provides a feature-rich, customizable tmux setup with visual themes, enhanced keybindings, and productivity features.

## Key Architecture

### Core Configuration Structure
- **`.tmux.conf`**: Main configuration file from upstream Oh my tmux! framework
  - Contains base tmux settings, key bindings, and core functionality
  - **🚨 NEVER MODIFY** - marked as read-only by upstream maintainers
  - Located at `/home/jvian/dotfile-tmux/.tmux.conf`

- **`.tmux.conf.local`**: Local customization file for user-specific settings
  - Contains theme colors, status line configuration, and personal preferences
  - This is the **ONLY** file that should be modified for customizations
  - Located at `/home/jvian/dotfile-tmux/.tmux.conf.local`

### Configuration Approach
The configuration follows a two-file approach:
1. Base configuration (`.tmux.conf`) provides the framework
2. Local customization (`.tmux.conf.local`) provides user overrides

All customizations must use the `#!important` suffix when overriding base settings.

## Key Features and Bindings

### Prefix Keys
- Primary prefix: `C-b` (default tmux)
- Secondary prefix: `C-a` (GNU Screen compatible)

### Essential Key Bindings
- `<prefix> e`: Edit local configuration file
- `<prefix> r`: Reload configuration
- `<prefix> +`: Maximize current pane to new window
- `<prefix> m`: Toggle mouse mode
- `<prefix> -`: Split pane vertically
- `<prefix> _`: Split pane horizontally

### Session Management (Enhanced)
- `<prefix> S`: Choose session from list
- `<prefix> K`: Kill current session (with confirmation)
- `<prefix> C-c`: Create new session
- `<prefix> C-f`: Find session by name

### Advanced Features
- `<prefix> Y`: Toggle pane synchronization
- Mouse wheel scrolling in copy mode
- Enhanced terminal RGB color support

### Navigation
- `<prefix> h/j/k/l`: Navigate panes (Vim-style)
- `<prefix> H/J/K/L`: Resize panes
- `<prefix> C-h/C-l`: Navigate windows

## Development Workflow

### Making Configuration Changes
1. **NEVER** edit `.tmux.conf` directly
2. Edit `.tmux.conf.local` using `<prefix> e` or directly with your editor
3. Reload configuration with `<prefix> r`
4. Test changes in current tmux session

### Testing Configuration
```bash
# Test with clean config to isolate issues
tmux -f /dev/null -L test

# Normal reload after changes
tmux source-file ~/.tmux.conf
```

### Installing/Updating
This repository is meant to be symlinked from the user's home directory:
```bash
ln -s dotfile-tmux/.tmux.conf .tmux.conf
```

## Customization Variables

The `.tmux.conf.local` file uses variables prefixed with `tmux_conf_` to control behavior:

### Theme Colors
- `tmux_conf_theme_colour_1` through `tmux_conf_theme_colour_17`: Color palette
- `tmux_conf_theme_*_fg/bg`: Foreground/background colors for various elements

### Status Line Configuration  
- `tmux_conf_theme_status_left/right`: Configure status bar content
- Supports built-in variables like `#{battery_percentage}`, `#{hostname}`, `#{uptime_*}`

### Feature Toggles
- `tmux_conf_preserve_stock_bindings`: Keep default tmux bindings
- `tmux_conf_new_*_retain_current_path`: Path behavior for new sessions/windows/panes
- `tmux_conf_theme_highlight_focused_pane`: Visual pane highlighting

## Important Notes

- This configuration requires tmux >= 2.6
- Depends on system tools: awk, perl, grep, sed
- TERM environment variable should be set to `xterm-256color`
- TPM (Tmux Plugin Manager) support is built-in
- Mouse mode can be toggled for accessibility

## Performance Optimizations (v2024.1)

- **Status interval**: 5 seconds (improved from 10s for better responsiveness)
- **History limit**: 10,000 lines (increased from 5,000 for better scrollback)
- **Terminal support**: Enhanced with `tmux-256color` and RGB color support
- **Mouse integration**: Wheel scrolling support in copy mode

## Plugin Configuration

### Enabled Plugins
- **tmux-resurrect**: Session persistence across reboots
- **tmux-continuum**: Automatic session saving every 15 minutes
- **Neovim integration**: Special handling for Neovim sessions
- **Pane content capture**: Saves pane contents for full restoration

## Common Tasks

### Reload Configuration
```bash
tmux source-file ~/.tmux.conf
# Or use <prefix> r from within tmux
```

### Edit Configuration  
```bash
# From within tmux (recommended)
<prefix> e

# Or directly
vim ~/.tmux.conf.local
```

### Troubleshooting
1. Ensure no conflicting tmux processes are running
2. Test with minimal config: `tmux -f /dev/null -L test`
3. Check terminal TERM variable is set correctly
4. Verify required system tools (awk, perl, grep, sed) are installed