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
        discord \
        redshift \
        tree \
        vim
fi

# install chrome
if check "Install Google Chrome browser";
then
    mkdir ~/Utils
    cd ~/Utils
    git clone https://aur.archlinux.org/google-chrome.git
    cd google-chrome
    makepkg -s
    sudo pacman -U --noconfirm google-chrome*.zst
fi

# install packages for YCM
if check "Install packages to compile YouCompleteMe plugin";
then
    sudo pacman -S \
        base-devel \
        cmake \
        go \
        npm \
        mono \
        nodejs \
        jdk-openjdk
fi

# install vundle
if check "Install vundle";
then
    git clone git@github.com:VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    echo [+] Don\'t forget to run \`:PluginInstall\` next time you open vim
fi

# install and enable snapd
if check "Install and enable snapd";
then
    sudo pacman -S snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
fi

# install snap packages
if check "Install teams-for-linux";
then
    sudo snap install teams-for-linux
fi

# set git account
if check "Config git with default account (Ewael)";
then
    git config --global user.email "turodoras@gmail.com"
    git config --global user.name "Ewael"
fi
