#!/bin/sh

rofi \
    -show run -modi run -location 1 -width 100 \
    -lines 2 -line-margin 0 -line-padding 1 \
    -separator-style none -font "mono 10" -columns 9 -bw 0 \
    -disable-history \
    -hide-scrollbar \
    -color-window "#222222, #222222, #b1b4b3" \
    -color-normal "#222222, #b1b4b3, #222222, #EE7313, #b1b4b3" \
    -color-active "#222222, #b1b4b3, #222222, #EE7313, #b1b4b3" \
    -color-urgent "#222222, #b1b4b3, #222222, #EE7313, #b1b4b3" \
    -kb-row-select "Tab" -kb-row-tab ""
