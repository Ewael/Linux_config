#!/bin/bash

# exit on error
set -e

# os check
case `uname -r | tr '[:upper:]' '[:lower:']` in
    *manjaro*)
        os=manjaro
    ;;
    *generic*)
        os=ubuntu
    ;;
    *kali*)
        os=kali
    ;;
esac
echo [+] Detected OS is "$os"

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
    cp -v dotfiles/zsh/custom.zsh-theme ~/.oh-my-zsh/themes/
    cp -v dotfiles/zsh/.zshrc ~/
fi

if check "Update .vimrc";
then
    cp -v dotfiles/vim/.vimrc ~/
fi

if check "Update .i3/config";
then
    cp -v dotfiles/i3/config ~/.i3/
fi

if check "Update terminator";
then
    mkdir -p ~/.config/terminator
    cp -v dotfiles/terminator/config_"$os" ~/.config/terminator/config
fi
