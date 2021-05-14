#!/bin/bash

pkill picom && flameshot gui --path ~/Pictures ; sleep 3s ; picom &
