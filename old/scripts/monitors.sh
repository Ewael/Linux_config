#!/bin/sh

xrandr \
    --output DVI-D-0 --primary --mode 1920x1080 --pos 0x460 --rotate normal \
    --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate right \
    --output DP-1 --off \
    --output DP-1 --off \
    --output DVI-I-0 --off \
    --output DVI-I-1 --off


nitrogen --restore
nitrogen --set-auto ~/Linux_config/wallpapers/orange_city.jpg --head=0
nitrogen --set-auto ~/Linux_config/wallpapers/orange_vertical.jpg --head=1
