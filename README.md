# Linux_config

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

- Update and upgrade

    * `pacman -Sy`
    * `pacman -Syu`
    * `pacman -Syyu`

- Remove *beep* sound

    * `sudo rmmod pcspkr`
    * `sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf`

- Install browsers

    * `pacman -S firefox`
    * `pacman -S chromium`

- Generate ssh public key and add it to Github

    * `ssh-keygen`

- Install zsh and oh-my-zsh

    * `pacman -S zsh`
    * `sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
    * `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
    * `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
    * `chsh -s $(which zsh)`

- Install Discord

    * `pacman -S discord`

- Install VirtualBox

    * `mhwd-kernel -li`
    * `sudo pacman -Syu virtualbox linux[xx]-virtualbox-host-modules`
    * `sudo vboxreload`
    * `pamac build virtualbox-ext-oracle`

- Install redshift

    * `pacman -S redshift`

- Install vundle

    * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    * `vim`
    * `:PluginInstall`

- Install pavucontrol

    * `pacman -S pavucontrol`

- Install xcwd

    * `cd /opt; git clone git@github.com:schischi/xcwd.git`
    * `cd xcwd; make`
    * `make install`
