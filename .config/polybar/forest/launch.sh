#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/forest"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
# polybar -q main -c "$DIR"/config.ini &
polybar DP-2 -c "$DIR"/config.ini &
polybar HDMI-0 -c "$DIR"/config.ini &
polybar DVI-D-0 -c "$DIR"/config.ini &
