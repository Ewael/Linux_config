#!/bin/sh

# This scripts update Linux config files
# It takes one argument which is what want to update
# Usage: ./update.sh arg

# help
if [ "$1" = "--help" ]; then
<<<<<<< HEAD
    echo "Exec ./update.sh with one of the following args:

        chromium    - chromium flags
        general     - xinitrc and Xresources files
        i3          - i3 config file
        redshift    - redshift config file
        vim         - vim config file
        zsh         - zsh config file

        arch        - general, i3, redshift, vim, zsh
        kali        - chromium, redshift, vim, zsh"
fi

arch=false
kali=false

####### GENERAL ARGS #######

# arch
if [ "$1" = "arch" ]; then
    echo "# Updating general, i3, redshift, vim, zsh files"
    arch=true
fi

# kali
if [ "$1" = "kali" ]; then
    echo "# Updating chromium, redshift, vim, zsh files"
    kali=true
fi

####### INDIV ######

# chromium
if [ "$1" = "chromium" ] || [ "$kali" = true ]; then
    echo "-- Updating chromium flags"
    cp chromium/default-flags /etc/chromium.d/default-flags
fi

# general
if [ "$1" = "general" ] || [ "$arch" = true ]; then
    echo "-- Updating general files"
    cp general/.Xresources general/.xinitrc ~
fi

# i3
if [ "$1" = "i3" ] || [ "$arch" = true ]; then
    echo "-- Updating i3 config file"
    cp i3/config ~/.i3
fi

# redshift
if [ "$1" = "red" ] || [ "$arch" = true ] || [ "$kali" = true ]; then
    echo "-- Updating redshift config file"
    cp redshift/redshift.conf ~/.config
fi

# vim
if [ "$1" = "vim" ] || [ "$arch" = true ] || [ "$kali" = true ]; then
    echo "-- Updating vim config file"
    cp vim/.vimrc ~
fi

# zsh
if [ "$1" = "zsh" ] || [ "$arch" = true ] || [ "$kali" = true ]; then
    echo "-- Updating zsh config file"
    if [ "$arch" = true ]; then
        cp zsh/Arch/.zshrc ~
    fi
    if [ "$kali" = true ]; then
        cp zsh/Kali/.zshrc ~
    fi
fi

####### END #######

# wrong arg
if [ $# != 1 ]; then
    echo "Wrong number of arguments, please exec ./update.sh --help"
fi
