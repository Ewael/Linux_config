#!/bin/bash

# left horizontal screen
# right vertical screen

xrandr \
    --output DVI-D-1 --primary --mode 1920x1080 --pos 0x455 --rotate normal \
    --output HDMI-1 --mode 0x47 --pos 1920x0 --rotate left \
    --output DVI-I-1 --off \
    --output DP-1 --off
