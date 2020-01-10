#!/bin/sh

# This scripts update Linux config files
# It takes one argument which is what want to update
# Usage: ./update.sh arg

# .zshrc
if [ "$1" = "zsh" ]; then
    echo "cp zsh/.zshrc ~"
    cp zsh/.zshrc ~
# .Xressources
elif [ "$1" = "general" ]; then
    echo "cp general/.Xressources ~"
    cp general/.Xressources ~
# .vimrc
elif [ "$1" = "vim" ]; then
    echo "cp vim/.vimrc ~"
    cp vim/.vimrc ~
# wrong arg
else
    echo "Not supported yet"
fi
