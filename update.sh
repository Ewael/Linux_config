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
    if check "Is this home config";
    then
        cp -v scripts/monitors.sh.desktop ~/.config/autostart
    fi
    if check "Is this LSE config";
    then
        cp -v scripts/lse_monitors.sh.desktop ~/.config/autostart
    fi
fi
