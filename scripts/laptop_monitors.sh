#!/bin/bash

# plugged screen top
# base screen bot

sleep 5

xrandr \
    --output eDP-1 --primary --pos 0x1080 --mode 1920x1080 --rotate normal \
    --output HDMI-1 --mode 1920x1080 --rotate normal \
    --output DP-1 --off \
    --output DP-2 --off \
    --output HDMI-2 --off
