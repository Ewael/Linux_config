# Linux\_config

Here is the repo for my Linux (Manjaro i3 - community edition) configuration. This was made for my own usage. Please do not try to run on your system without adapting it before as it could really break your whole setup. Be sure to have a backup before considering using this config.

Also note that this is my first ever config. I mixed several configs and inspirations and adapted them to my own setup. All credit for the code I did not write myself goes to authors. Even if I modified most of the files, you can still find the original authors at the beginning of them (most of the time).

This repo is mainly a backup and an easy way to access my own config. It does not have any pretention and I do not plan to make it adaptable / portable. Please keep in mind that IDGF if you do not like it, this repo is public only because I love sharing what I do when this is possible.

## Usage

```
./update.sh [arg] [option]

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
        kali        - chromium, vim, zsh
```

## Installation

- update and upgrade
    * `pacman -Sy`
    * `pacman -Syu`
    * `pacman -Syyu`

- remove *beep* sound
    * `sudo rmmod pcspkr`
    * `sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf`

- generate ssh public key and add it to Github
    * `ssh-keygen`

- `zsh` and `oh-my-zsh`
    * `pacman -S zsh`
    * `sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
    * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
    * `chsh -s $(which zsh)`

- `virtualBox`
    * `mhwd-kernel -li`
    * `sudo pacman -Syu virtualbox linux[xx]-virtualbox-host-modules`
    * `sudo vboxreload`
    * `pamac build virtualbox-ext-oracle`

- `vundle`
    * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    * `vim`
    * `:PluginInstall`

- `xcwd`
    * `cd /Utils; git clone git@github.com:schischi/xcwd.git`
    * `cd xcwd; make`
    * `make install`

- enable snap
    * `pacman -S snapd`
    * `systemctl enable --now snapd.socket`
    * `ln -s /var/lib/snapd/snap /snap`

- various `pacman -S [app]`
    * `firefox`
    * `chromium`
    * `redshift`
    * `pavucontrol`
    * `thunar`
    * `fortune-cm`
    * `lolcat`
    * `cmatrix`
    * `cowsay`
    * `imagemagick`
    * `awk`
    * `ffmpegthumbnailer`
    * `ffmpeg`
    * `tumbler`
    * `picom`
    * `feh`
    * `nitrogen`
    * `polybar`
    * `net-tools`
    * `rofi`
    * `rofi-dmenu`
