#!/bin/bash

# left horizontal screen
# right vertical screen

sleep 5

xrandr \
    --output HDMI-2 --primary --mode 1920x1080 --pos 0x435 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate left \
    --output VGA-1 --off \
    --output DP-1 --off \
    --output DP-2 --off
