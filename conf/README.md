# Modular Tmux Configuration

This directory contains the split configuration files for easier maintenance of the tmux setup.

## Structure

- **general.conf** - Basic tmux settings (terminal, timing, history)
- **display.conf** - Display and appearance settings (indexing, titles, activity)
- **navigation.conf** - Key bindings for navigation (panes, windows, sessions)
- **copy-mode.conf** - Copy mode and clipboard configuration
- **init.conf** - Initialization and environment setup

## Usage

The main `.tmux.conf` file automatically sources all these configuration modules. To modify specific aspects of the configuration:

1. Edit the relevant configuration file in this directory
2. Reload tmux configuration with `<prefix> r` or `tmux source-file ~/.tmux.conf`

## Benefits

- **Easier maintenance** - Each aspect of configuration is in its own file
- **Better organization** - Related settings are grouped together
- **Easier customization** - Modify only the sections you need
- **Version control friendly** - Smaller, focused files are easier to track changes

## Backup

The original monolithic configuration is backed up as `.tmux.conf.backup` in the parent directory.