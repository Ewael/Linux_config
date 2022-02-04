#!/bin/bash

# exit on error
set -e

# y/n prompt function
check ()
{
    echo -n "[x] $@ (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ];
    then
        return 0
    else
        return 1
    fi
}

if check "Update .zshrc";
then
    cp -v dotfiles/zsh/.zshrc ~
fi

if check "Update .vimrc";
then
    cp -v dotfiles/vim/.vimrc ~
fi

if check "Update monitors config";
then
    sudo cp -v scripts/monitors.sh /etc/profile.d
fi
