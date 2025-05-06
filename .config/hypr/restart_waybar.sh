#!/bin/bash

# Kill Waybar if it is running
echo "starting killing"
pkill -x waybar
echo "waybar killed"

# Wait a moment for any cleanup (just to be sure)
sleep 0.5

# Try to restart Waybar
waybar &

# Wait for Waybar to initialize
sleep 1

# Check if Waybar is running by looking for the process
if pgrep -x "waybar" > /dev/null; then
    echo "Waybar restarted successfully!"
else
    echo "Failed to restart Waybar. Check your config."
fi
