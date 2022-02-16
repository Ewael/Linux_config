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

# install function
install ()
{
    if [ "$os" == manjaro ]
    then
        sudo pacman -Suy "$@"
    fi
    if [ "$os" == kali ]
    then
        sudo apt install "$@"
    fi
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
    if [ "$os" == manjaro ]
    then
        sudo pacman -Syy
        sudo pacman -Syu
        sudo pacman -Syyu
    fi
    if [ "$os" == kali ] || [ "$os" == ubuntu ]
    then
        sudo apt update
        sudo apt upgrade
        sudo apt autoremove
        sudo apt dist-upgrade
    fi
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
    if [ "$os" == manjaro ]
    then
        install \
            discord \
            redshift \
            vim \
            zip \
            unzip
    fi
    if [ "$os" == kali ]
    then
        install \
            python3-pip \
            vim-gtk
    fi
    if [ "$os" == ubuntu ]
    then
        install \
            curl \
            git \
            cmake
    fi
    # common pkgs
    install \
        tree \
        terminator
fi

# install packages for YCM
if check "Install packages to compile YouCompleteMe plugin";
then
    # os specific pkgs
    if [ "$os" == manjaro ]
    then
        install \
            base-devel \
            mono \
            go \
            jdk-openjdk
    fi
    if [ "$os" == kali ]
    then
        install \
            build-essential \
            mono-complete \
            golang \
            default-jdk
    fi
    # common pkgs
    install \
        cmake \
        nodejs \
        npm
fi

# install chrome
if check "Install Google Chrome browser";
then
    if [ "$os" == manjaro ]
    then
        mkdir ~/Utils
        cd ~/Utils
        git clone https://aur.archlinux.org/google-chrome.git
        cd google-chrome
        makepkg -s
        sudo pacman -U --noconfirm google-chrome*.zst
    else
        echo [x] Not implemented on this OS, please do it manually
    fi
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
    if [ "$os" == manjaro ]
    then
        sudo snap install teams-for-linux
        sudo snap install flameshot
    fi
    if [ "$os" == kali ] || [ "$os" == ubuntu ]
    then
        echo [+] No snap pkgs to install on this OS yet
    fi
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
