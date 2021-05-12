#!/bin/sh

xrandr \
    --output DP1 --primary --mode 1920x1080 --rotate normal \
    --output DP2 --mode 1920x1080 --rotate normal --right-of DP1
