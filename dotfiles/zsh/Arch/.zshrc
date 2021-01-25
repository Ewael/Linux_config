#!/usr/bin/env bash

##===========================================================================##
#                                *** ZSH ***                                  #
##===========================================================================##

# Path to your oh-my-zsh installation
# Do not forget to change name
export ZSH="/home/ewael/.oh-my-zsh"

# You can find more standard themes in ~/.oh-my-zsh/themes/*
ZSH_THEME="mytheme_orange"

# Browser
export BROWSER="/usr/bin/chromium"

# You can find more standard plugins in ~/.oh-my-zsh/plugins/*
plugins=(git colored-man-pages)
plugins=(zsh-autosuggestions)

# Uncomment the following line to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment the following line to display dots whilst waiting for completion
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

##===========================================================================##
#                             *** TERMINAL ***                                #
##===========================================================================##

# Make vim you default editor
export EDITOR=vim

# Display system info using neofetch
neofetch --ascii_distro arch

# Colored LS style when pressing `TAB` for suggestions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

##===========================================================================##
#                               *** ALIAS ***                                 #
##===========================================================================##

# Configuration file
alias bashconf='vim ~/.bashrc'  # Edit bash config file
alias zshconf='vim ~/.zshrc'  # Edit zsh config file
alias i3conf='vim ~/.config/i3/config'  # Edit i3 config file
alias vimconf='vim ~/.vimrc'  # Edit vim config file
alias neoconf='vim ~/.config/neofetch/config.conf'  # Edit neofetch config file

# System
alias wifi='nmcli dev wifi'  # Show all available wifi
alias install='sudo pacman -Suy'  # Install package on arch base distro
alias update='sudo pacman -Syu'  # Update package on arch base distro
alias remove='sudo pacman -Rcns'  # Remove package on arch base distro

# Terminal
alias la='ls -all'  # Display list of file with all information
alias q='exit'  # Exit terminal
alias sl='ls'  # Avoid spelling mistake
alias h='history'  # Show history
alias cp="cp -i"  # Confirm before overwriting something
alias rm='rm -iv' # Confirm before removing something

# Secu
alias clean="rm -f peda-session* .gdb_history core"

# Git
alias gst='git status'
alias ga='git add *'
alias gcmsg='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gt='git tag'
alias coolog='git log --graph --decorate'  # Nice display of git log

# C
alias mygcc='gcc -Wall -Wextra -Werror -std=c99 -O1 -o'
alias myg++='g++ -Wall -Wextra -Werror -pedantic -std=c++17 -o'
alias myclang++='clang++ -Wall -Wextra -Werror -pedantic -std=c++17 -o'

# Redshift
alias red='redshift -O 4000 -b 0.8'
alias redl='redshift -O 3500 -b 0.6'
alias redh='redshift -O 5500 -b 0.9'
alias redx='redshift -x'

# Misc
alias lol='fortune | cowsay | lolcat'
