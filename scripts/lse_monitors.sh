#!/bin/sh

xrandr \
    --output DP-1 --primary --mode 1920x1080 --rotate normal \
    --output DP-2 --mode 1920x1080 --rotate normal --right-of DP-1
