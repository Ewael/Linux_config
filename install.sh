#!/bin/bash

# exit on error
set -e

# detect OS
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
    if [ "$os" == kali ] || [ "$os" == ubuntu ]
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
    fi
    if [ "$os" == kali ] || [ "$os" == ubuntu ]
    then
        sudo apt update
        sudo apt upgrade
        sudo apt autoremove
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
    if [ "$os" == ubuntu ]
    then
        install \
            discord \
            redshift \
            vim \
            zip \
            unzip \
            tree \
            flameshot \
            python-pip
    fi
    if [ "$os" == kali ]
    then
        install \
            terminator \
            htop \
            neofetch
    fi
fi

# install chrome
if check "Install Google Chrome browser";
then
    mkdir ~/Utils
    cd ~/Utils
    git clone https://aur.archlinux.org/google-chrome.git
    cd google-chrome
    makepkg -si
fi

# install vim-plug
if check "Install vim-plug";
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo [+] Don\'t forget to run \`:PlugInstall\` next time you open vim
fi

# install packages for YCM
if check "Install YouCompleteMe Vim plugin";
then
    install \
        golang \
        mono-complete \
        nodejs \
        openjdk-17-jdk openjdk-17-jre \
        npm
    cd ~/.vim/plugged/YouCompleteMe
    python3 install.py --all --force-sudo
fi

# install and enable snapd
if check "Install and enable snapd";
then
    install snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
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
    install gdb gdb-multiarch
    bash -c "$(curl -fsSL http://gef.blah.cat/sh)"
    if [ "$os" == manjaro ]
    then
        pip install keystone-engine unicorn capstone ropper
    fi
    if [ "$os" == kali ]
    then
        pip3 install --break-system-packages \
            keystone-engine unicorn capstone ropper
    fi
fi
