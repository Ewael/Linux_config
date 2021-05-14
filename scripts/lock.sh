#!/bin/sh

scrot /tmp/screenshot.png
convert /tmp/screenshot.png -blur 0x5 /tmp/blur.png
i3lock -t -i /tmp/blur.png
