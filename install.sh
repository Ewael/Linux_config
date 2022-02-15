#!/bin/bash

# exit on error
set -e

# os check
case `uname -r | tr '[:upper:]' '[:lower:']` in
    *manjaro*)
        os=manjaro
    ;;
    *kali*)
        os=kali
    ;;
esac
echo [+] Detected OS is "$os"

# install function
install ()
{
    case "$os" in
        manjaro)
            sudo pacman -Suy "$@"
        ;;
        kali)
            sudo apt install "$@"
        ;;
    esac
}

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
    case "$os" in
        manjaro)
            sudo pacman -Syy
            sudo pacman -Syu
            sudo pacman -Syyu
        ;;
        kali)
            sudo apt update
            sudo apt upgrade
            sudo apt autoremove
            sudo apt dist-upgrade
        ;;
    esac
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
    # os specific pkgs
    case "$os" in
        manjaro)
            install \
                discord \
                redshift \
                vim \
                zip \
                unzip
        ;;
        kali)
            install \
                python3-pip \
                vim-gtk
        ;;
    esac
    # common pkgs
    install \
        tree \
        terminator
fi

# install packages for YCM
if check "Install packages to compile YouCompleteMe plugin";
then
    # os specific pkgs
    case "$os" in
        manjaro)
            install \
                base-devel \
                mono \
                go \
                jdk-openjdk
        ;;
        kali)
            install \
                build-essential \
                mono-complete \
                golang \
                default-jdk
        ;;
    esac
    # common pkgs
    install \
        cmake \
        nodejs \
        npm
fi

# install chrome
if check "Install Google Chrome browser";
then
    case "$os" in
        manjaro)
            mkdir ~/Utils
            cd ~/Utils
            git clone https://aur.archlinux.org/google-chrome.git
            cd google-chrome
            makepkg -s
            sudo pacman -U --noconfirm google-chrome*.zst
        ;;
        kali)
            echo [x] Not implemented, please do it manually
        ;;
    esac
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
    install snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
fi

# install snap packages
if check "Install snap packages";
then
    case "$os" in
        manjaro)
            sudo snap install teams-for-linux
            sudo snap install flameshot
        ;;
        kali)
            echo [+] No snap pkgs to install on kali yet
        ;;
    esac
fi

# set git account
if check "Config git with default account (Ewael)";
then
    git config --global user.email "turodoras@gmail.com"
    git config --global user.name "Ewael"
fi

# install gef
if check "Install GDB and GEF";
then
    install gdb
    bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
    pip install keystone-engine unicorn capstone ropper
fi
