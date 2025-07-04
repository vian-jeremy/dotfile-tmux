#!/bin/bash
# Test script to verify TMUX mouse functionality

echo "=== TMUX Mouse Functionality Test ==="
echo

echo "1. Current mouse setting:"
echo "   $(tmux show-options -g mouse)"
echo

echo "2. Testing mouse toggle script:"
echo "   Before toggle: $(tmux show-options -g mouse | cut -d' ' -f2)"
~/dotfile-tmux/scripts/utils/toggle-mouse
echo "   After toggle:  $(tmux show-options -g mouse | cut -d' ' -f2)"
~/dotfile-tmux/scripts/utils/toggle-mouse  
echo "   After toggle back: $(tmux show-options -g mouse | cut -d' ' -f2)"
echo

echo "3. Key binding test:"
echo "   - Press 'Prefix + m' in TMUX to toggle mouse mode"
echo "   - Prefix is typically Ctrl+B or Ctrl+A"
echo

echo "4. Mouse functionality to test:"
echo "   ✓ Click to focus panes"
echo "   ✓ Click to focus windows"
echo "   ✓ Drag pane borders to resize"
echo "   ✓ Scroll to navigate history"
echo "   ✓ Double-click to select words"
echo "   ✓ Right-click for context menu (if supported by terminal)"
echo

echo "5. Troubleshooting:"
echo "   - Ensure your terminal supports mouse events"
echo "   - Try different terminals: kitty, alacritty, iTerm2, etc."
echo "   - Check terminal mouse settings"
echo "   - Verify TMUX version: $(tmux -V)"
echo

echo "=== Test Complete ==="
echo "Mouse should be working. If not, check terminal compatibility."