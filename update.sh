#!/bin/sh

# This scripts update Linux config files
# It takes one argument which is what want to update
# Usage: ./update.sh arg

display_help ()
{
    echo "./update.sh [arg] [option]

        chromium    - chromium flags (for Kali as root)
        general     - xinitrc and Xresources files
        i3          - i3 config file
        neofetch    - neofetch config file
        picom       - picom config file
        polybar     - polybar confiles files
        vim         - vim config file
        zsh [sys]   - zsh confile file + oh-my-zsh theme
            + arch
            + kali

        arch        - general, i3, vim, zsh, neofetch, polybar, picom
        kali        - chromium, vim, zsh"
}

arch=false
kali=false


update_chromium ()
{
    echo "[+] Updating chromium flags"
    cp dotfiles/chromium/default-flags /etc/chromium.d/default-flags
}

update_general ()
{
    echo "[+] Updating general files"
    cp dotfiles/general/.Xresources dotfiles/general/.xinitrc ~
}

update_i3 ()
{
    echo "[+] Updating i3 config file"
    cp dotfiles/i3/config ~/.i3
}

update_rofi ()
{
    echo "[+] Updating rofi confile file"
    cp dotfiles/rofi/dmenu_rofi.sh ~/.config/rofi
}

update_neofetch ()
{
    echo "[+] Updating neofetch config file"
    cp dotfiles/neofetch/config.conf ~/.config/neofetch
}

update_picom ()
{
    echo "[+] Updating picom config file"
    cp dotfiles/picom/picom.conf ~/.config/picom
    echo "[+] Deleting old ~/.config/compton.conf"
    rm -fv ~/.config/compton.conf
}

update_polybar ()
{
    echo [+] Updating polybar config files
    cp -r dotfiles/polybar/* ~/.config/polybar
}

update_vim ()
{
    echo "[+] Updating vim config file"
    cp dotfiles/vim/.vimrc ~
}

update_zsh ()
{
    if [ "$@" = "arch" ]; then
        echo "[+] Updating zsh config file for Arch"
        cp dotfiles/zsh/Arch/.zshrc ~
    fi
    if [ "$@" = "kali" ]; then
        echo "[+] Updating zsh config file for Kali"
        cp dotfiles/zsh/Kali/.zshrc ~
    fi
}

update_arch ()
{
    echo "[x] Updating Arch config files"
    update_general
    update_i3
    update_neofetch
    update_picom
    update_polybar
    update_vim
    update_zsh "arch"
}

update_kali ()
{
    echo "[x] Updating Kali config files"
    udpate_chromium
    update_vim
    update_zsh "kali"
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ];
then
    display_help
    exit 1
fi

case "$1" in
    "arch")         update_arch;;
    "kali")         update_kali;;
    "chromium")     update_chromium;;
    "general")      update_general;;
    "i3")           update_i3;;
    "rofi")         update_rofi;;
    "neofetch")     update_neofetch;;
    "picom")        update_picom;;
    "polybar")      update_poylbar;;
    "vim")          update_vim;;
    "zsh")          update_zsh "$2";;
    *)              display_help;;
esac
