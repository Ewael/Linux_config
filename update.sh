#!/bin/sh

# This scripts update Linux config files
# It takes one argument which is what want to update
# Usage: ./update.sh arg

# all
all=false
if [ "$1" = "all" ]; then
    all=true
fi

# zsh
if [ "$1" = "zsh" ] || [ "$all" = true ]; then
    echo "Updating zsh config file"
    cp zsh/.zshrc ~
fi

# system
if [ "$1" = "general" ] || [ "$all" = true ]; then
    echo "Updating .X**** files"
    cp general/.Xresources general/.xinitrc ~
fi

# vim
if [ "$1" = "vim" ] || [ "$all" = true ]; then
    echo "Updating vim config file"
    cp vim/.vimrc ~
fi

# i3
if [ "$1" = "i3" ] || [ "$all" = true ]; then
    echo "Updating i3 config file"
    cp i3/config ~/.config/i3
fi
# redshift

if [ "$1" = "red" ] || [ "$all" = true ]; then
    echo "Updating redshift config file"
    cp redshift/redshift.conf ~/.config
fi

# wrong arg
if [ $# != 1 ]; then
    echo "Please choose a valid option"
fi

echo "Done"
