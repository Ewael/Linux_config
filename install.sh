#!/bin/bash

# Reminder: 0 is success and 1 is failure in bash

echo "[o] This script will apply some changes to the system"
echo "[o] It may be required to enter \`sudo\` password as it uses \`pacman\`"
echo "[o] Each step requires a confirmation input by you"

oldpwd=`pwd`
cd ~

# y/n prompt function
check ()
{
    echo [+] "$@"
    echo -n "[x] Do you want to apply these changes (y/n)? "
    read answer
    if [ "$answer" != "${answer#[Yy]}" ];
    then
        return 0
    else
        return 1
    fi
}

# update and upgrade
update ()
{
    sudo pacman -Syy
    sudo pacman -Syu
    sudo pacman -Syyu
}
if check "This will update the system"; then update; fi

# remove *beep* sound
removeBeep ()
{
    sudo rmmod pcspkr
    sudo echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
}
if check "This will remove the *beep* system sound"; then removeBeep; fi

# generate ssh key
generateKey ()
{
    ssh-keygen
}
if check "This will generate an ssh key"; then generateKey; fi

# install `zsh` and `oh-my-zsh`
installShell ()
{
    pacman -S zsh
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    chsh -s $(which zsh)
}

# virtualBox
