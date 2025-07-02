# Tmux Keybindings Cheatsheet

**Default Prefix Key: `Ctrl+B`** (shown as `<prefix>`)

## Session Management

### Basic Session Control
- `tmux new-session -s <name>` - Create new named session
- `tmux attach -t <name>` - Attach to session
- `tmux list-sessions` - List all sessions
- `tmux kill-session -t <name>` - Kill session

### Within Tmux
- `<prefix> d` - Detach from session
- `<prefix> s` - List and switch between sessions
- `<prefix> $` - Rename current session
- `<prefix> (` - Switch to previous session
- `<prefix> )` - Switch to next session

---

## Window Management

### Window Creation & Navigation
- `<prefix> c` - Create new window
- `<prefix> ,` - Rename current window
- `<prefix> n` - Next window
- `<prefix> p` - Previous window
- `<prefix> 0-9` - Switch to window by number
- `<prefix> l` - Switch to last active window
- `<prefix> w` - List all windows
- `<prefix> f` - Find window by name

### Window Control
- `<prefix> &` - Kill current window
- `<prefix> .` - Move current window to another index

---

## Pane Management

### Pane Creation
- `<prefix> %` - Split window vertically (left/right)
- `<prefix> "` - Split window horizontally (top/bottom)

### Pane Navigation
- `<prefix> o` - Go to next pane
- `<prefix> ;` - Go to last active pane
- `<prefix> h/j/k/l` - Navigate panes (vim-style, if configured)
- `<prefix> ↑/↓/←/→` - Navigate panes with arrow keys

### Pane Resizing
- `<prefix> Ctrl+↑/↓/←/→` - Resize pane
- `<prefix> Alt+↑/↓/←/→` - Resize pane (alternative)

### Pane Control
- `<prefix> x` - Kill current pane
- `<prefix> !` - Break pane into new window
- `<prefix> z` - Toggle pane zoom (fullscreen)
- `<prefix> {` - Move pane left
- `<prefix> }` - Move pane right
- `<prefix> q` - Show pane numbers (then press number to switch)

### Pane Layouts
- `<prefix> Space` - Cycle through pane layouts
- `<prefix> Alt+1` - Even horizontal layout
- `<prefix> Alt+2` - Even vertical layout
- `<prefix> Alt+3` - Main horizontal layout
- `<prefix> Alt+4` - Main vertical layout
- `<prefix> Alt+5` - Tiled layout

---

## Copy Mode & Scrolling

### Enter Copy Mode
- `<prefix> [` - Enter copy mode (scroll/search)
- `q` - Exit copy mode

### Navigation in Copy Mode
- `h/j/k/l` - Move cursor (vim-style)
- `↑/↓/←/→` - Move cursor with arrows
- `w/b` - Move by word forward/backward
- `0/$` - Beginning/end of line
- `g/G` - Top/bottom of buffer
- `Ctrl+u/d` - Page up/down

### Selection & Copying
- `Space` - Start selection
- `Enter` - Copy selection and exit copy mode
- `v` - Start selection (if vi mode enabled)
- `y` - Copy selection (if vi mode enabled)

### Search in Copy Mode
- `/` - Search forward
- `?` - Search backward
- `n` - Next search result
- `N` - Previous search result

---

## Clipboard Integration

### Paste
- `<prefix> ]` - Paste from tmux clipboard
- `<prefix> =` - Choose from paste buffer list

---

## Help & Information

### Getting Help
- `<prefix> ?` - List all keybindings
- `<prefix> :` - Enter command mode
- `tmux list-keys` - List all keybindings (outside tmux)

### Status & Information
- `<prefix> t` - Show time
- `<prefix> ~` - Show messages
- `<prefix> i` - Display window information

---

## Command Mode

### Entering Commands
- `<prefix> :` - Enter command mode

### Useful Commands
- `:new-window -n <name>` - Create named window
- `:kill-server` - Kill tmux server
- `:source-file ~/.tmux.conf` - Reload config
- `:list-sessions` - List sessions
- `:rename-session <name>` - Rename session

---

## Advanced Features

### Synchronize Panes
- `:setw synchronize-panes on` - Type in all panes simultaneously
- `:setw synchronize-panes off` - Disable synchronization

### Mouse Support
- `:set mouse on` - Enable mouse support
- `:set mouse off` - Disable mouse support

---

## Quick Reference - Most Used

### Essential Commands
- `<prefix> c` - New window
- `<prefix> "` - Split horizontal
- `<prefix> %` - Split vertical
- `<prefix> o` - Next pane
- `<prefix> x` - Kill pane
- `<prefix> d` - Detach session

### Navigation Shortcuts
- `<prefix> n/p` - Next/previous window
- `<prefix> 0-9` - Jump to window number
- `<prefix> [` - Scroll mode
- `<prefix> z` - Zoom pane

---

## Configuration Tips

### Common .tmux.conf Settings
```bash
# Change prefix key to Ctrl+A
set -g prefix C-a
unbind C-b

# Enable vi keys
setw -g mode-keys vi

# Enable mouse
set -g mouse on

# Start windows and panes at 1
set -g base-index 1
setw -g pane-base-index 1
```

---

*Generated for default tmux configuration (prefix: Ctrl+B)*