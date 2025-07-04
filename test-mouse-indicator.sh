#!/bin/bash
# Test script to verify TMUX mouse indicator and toggle functionality

echo "=== TMUX Mouse Indicator Test ==="
echo

echo "1. Current status-right configuration:"
echo "   $(tmux show-options -g status-right)"
echo

echo "2. Current mouse setting:"
echo "   $(tmux show-options -g mouse)"
echo

echo "3. Status bar indicator components:"
echo "   ⌨ (Yellow) - Shows when prefix key is pressed"
echo "   ↗ (Blue)   - Shows when mouse mode is enabled"
echo

echo "4. Testing mouse toggle with display messages:"
echo "   Before toggle: $(tmux show-options -g mouse | cut -d' ' -f2)"
echo "   → Running toggle script (should show display message)"
~/dotfile-tmux/scripts/utils/toggle-mouse
sleep 3  # Wait for display message to clear
echo "   After toggle:  $(tmux show-options -g mouse | cut -d' ' -f2)"
echo "   → Running toggle script again"
~/dotfile-tmux/scripts/utils/toggle-mouse  
sleep 3  # Wait for display message to clear
echo "   After toggle back: $(tmux show-options -g mouse | cut -d' ' -f2)"
echo

echo "5. Visual verification:"
echo "   ✓ Look at your TMUX status bar (bottom of screen)"
echo "   ✓ When mouse is ON:  You should see '↗' in blue at the left of status bar"
echo "   ✓ When mouse is OFF: The '↗' symbol should disappear"
echo "   ✓ Press your prefix key (Ctrl+B or Ctrl+A) and you should see '⌨' in yellow"
echo

echo "6. Key binding test:"
echo "   → Press 'Prefix + m' in TMUX to toggle mouse mode"
echo "   → You should see a display message: '↗ Mouse mode: ON' or '🚫 Mouse mode: OFF'"
echo "   → The indicator in the status bar should change accordingly"
echo

echo "7. Current indicators visible:"
if tmux show-options -g mouse | grep -q "on"; then
    echo "   ✅ Mouse indicator should be visible: ↗ (blue)"
else
    echo "   ❌ Mouse indicator should be hidden (mouse off)"
fi
echo "   ⌨ Prefix indicator appears only when prefix is pressed"
echo

echo "=== Test Complete ==="
echo "Your status bar should now show: [⌨][↗] battery time date | user | host"