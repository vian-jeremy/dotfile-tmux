#!/bin/bash
# Debug script to test all status bar components

echo "=== TMUX Status Bar Component Debug ==="
echo

echo "1. Testing username script:"
echo "   Command: ~/dotfile-tmux/scripts/system/username"
echo "   Output: $(~/dotfile-tmux/scripts/system/username)"
echo

echo "2. Testing hostname script:"
echo "   Command: ~/dotfile-tmux/scripts/system/hostname"  
echo "   Output: $(~/dotfile-tmux/scripts/system/hostname)"
echo

echo "3. Testing battery script:"
echo "   Command: ~/dotfile-tmux/scripts/battery/battery-status"
echo "   Output: '$(~/dotfile-tmux/scripts/battery/battery-status)'"
echo

echo "4. Testing date components:"
echo "   Time (%R): $(date +'%R')"
echo "   Date (%d %b): $(date +'%d %b')"
echo

echo "5. Current status-right configuration:"
tmux show-options -g status-right
echo

echo "6. Testing full status-right expansion:"
echo "   Creating test session..."
tmux new-session -d -s debug-test
sleep 1
echo "   Status bar should show: [session] [battery] [time] [date] | [username] | [hostname]"
echo "   Actual components:"
echo "   - Battery: '$(~/dotfile-tmux/scripts/battery/battery-status)'"
echo "   - Time: $(date +'%R')"
echo "   - Date: $(date +'%d %b')"
echo "   - Username: $(~/dotfile-tmux/scripts/system/username)"
echo "   - Hostname: $(~/dotfile-tmux/scripts/system/hostname)"
echo
echo "   Killing test session..."
tmux kill-session -t debug-test 2>/dev/null
echo
echo "7. Testing TMUX configuration reload:"
if tmux source-file ~/.tmux.conf; then
    echo "   ✅ Configuration reloaded successfully"
else
    echo "   ❌ Configuration reload failed"
fi
echo

echo "=== INSTRUCTIONS ==="
echo "To see the changes in your TMUX status bar:"
echo "1. If you're already in a TMUX session, the status bar should update within 10 seconds"
echo "2. Or start a new TMUX session: tmux new-session"
echo "3. Look at the bottom of the screen for the status bar"
echo "4. You should see: [session name] [time] [date] | [username] | [hostname]"
echo "   Example: ❐ 0  20:41  04 Jul | jvian | nova"
echo

echo "=== Debug Complete ==="