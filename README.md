# Linux\_config

Here is the repo for my Linux configuration.

## Usage

```
Exec ./update.sh with one of the following args:

        chromium    - chromium flags
        general     - xinitrc and Xresources files
        i3          - i3 config file
        redshift    - redshift config file
        vim         - vim config file
        zsh         - zsh config file

        arch        - general, i3, redshift, vim, zsh
        kali        - chromium, redshift, vim, zsh
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
