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

# update packages
if check "Update the system";
then
    sudo pacman -Syy
    sudo pacman -Syu
    sudo pacman -Syyu
fi

# install oh-my-zsh
if check "Install oh-my-zsh and some plugins";
then
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# install important packages
if check "Install important packages";
then
    sudo pacman -S \
        vim \
        redshift \
        chromium \
        tree
fi

# install vundle
if check "Install vundle";
then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo [+] Don\'t forget to run \`:PluginInstall\` next time you open vim
fi
