#!/bin/sh

# This scripts update Linux config files
# It takes one argument which is what want to update
# Usage: ./update.sh arg

# all
if [ "$1" = "all" ]; then
    echo "Updating all config files"
    cp zsh/.zshrc general/.Xresources vim/.vimrc ~
# .zshrc
elif [ "$1" = "zsh" ]; then
    echo "cp zsh/.zshrc ~"
    cp zsh/.zshrc ~
# .Xresources
elif [ "$1" = "general" ]; then
    echo "cp general/.Xresources ~"
    cp general/.Xresources ~
# .vimrc
elif [ "$1" = "vim" ]; then
    echo "cp vim/.vimrc ~"
    cp vim/.vimrc ~
# i3 config
elif [ "$1" = "i3" ]; then
    echo "cp i3/config ~"
    cp i3/config ~/.config/i3
# wrong arg
else
    echo "Not supported yet"
fi
