# TMUX Configuration Changelog

## [v2024.2-pre-release] - 2025-07-05 - Pre-release Coordination

### 🔄 Multi-Repository Release
- **COORDINATED** pre-release across dotfiles ecosystem
- **SYNCHRONIZED** with main dotfiles v2.1.0-pre-release
- **ALIGNED** with Neovim configuration v2.1.0-pre-release

### 🚀 Enhanced Features
- **MAINTAINED** all existing performance improvements
- **PRESERVED** session management and plugin enhancements
- **CONTINUED** support for advanced pane operations

### 📚 Documentation
- **ALIGNED** with unified release documentation
- **MAINTAINED** comprehensive CHANGELOG format
- **COORDINATED** version tracking across repositories

---

## [v2024.1] - 2025-01-05

### Performance Improvements
- **Status interval**: Reduced from 10s to 5s for better responsiveness
- **History limit**: Increased from 5,000 to 10,000 lines for better scrollback

### Terminal Support
- **Enhanced terminal**: Changed from `screen-256color` to `tmux-256color`
- **RGB color support**: Added `*:RGB` terminal override for true color support
- **Better color rendering**: Improved compatibility with modern terminals

### Mouse Integration
- **Wheel scrolling**: Added mouse wheel support in copy mode
- **Enhanced navigation**: Improved copy-mode mouse interactions
- **Better accessibility**: Smoother scrolling experience

### Session Management
- **Session chooser**: Added `<prefix> + S` to list and choose sessions
- **Kill session**: Added `<prefix> + K` with confirmation prompt
- **Improved workflow**: Better session navigation and management

### Plugin Management
- **tmux-resurrect**: Enabled session persistence across reboots
- **tmux-continuum**: Enabled automatic session saving every 15 minutes
- **Neovim integration**: Added special handling for Neovim sessions
- **Pane content capture**: Enabled saving of pane contents for full restoration

### Advanced Features
- **Pane synchronization**: Added `<prefix> + Y` to toggle sync across panes
- **Visual feedback**: Enhanced status messages for toggle operations
- **Better workflow**: Improved multi-pane development experience

### Configuration Structure
- **Modular design**: Maintained clean separation of concerns
- **Documentation**: Updated CLAUDE.md with new features and bindings
- **Testing**: Verified all changes work correctly with TMUX 3.6

### Key Bindings Added
- `<prefix> + S`: Choose session from list
- `<prefix> + K`: Kill current session (with confirmation)
- `<prefix> + Y`: Toggle pane synchronization
- Mouse wheel scrolling in copy mode

### Technical Details
- **Compatibility**: Tested with TMUX 3.6 (statically built)
- **Cross-platform**: All changes maintain cross-platform compatibility
- **Performance**: Optimized for better responsiveness and user experience
- **Security**: Maintained security best practices throughout

### Breaking Changes
None - all changes are backward compatible and enhance existing functionality.

### Migration Notes
- No manual migration required
- Existing sessions will benefit from improved performance
- New plugin functionality will be available after plugin installation (`<prefix> + I`)