#!/usr/bin/env bash

##===========================================================================##
#                                *** ZSH ***                                  #
##===========================================================================##

# Path to your oh-my-zsh installation
# Do not forget to change name
export ZSH="/root/.oh-my-zsh"

# You can find more standard themes in ~/.oh-my-zsh/themes/*
ZSH_THEME="robbyrussell"

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
neofetch --ascii_distro kali

# Display entire curr dir path
PROMPT='${ret_status} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'

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
alias install='apt install'
alias update='apt update'
alias upgrade='apt upgrade'
alias autoremove='apt autoremove'
alias dist-upgrade='apt dist-upgrade'
alias fresh='update && upgrade && autoremove && dist-upgrade'

# Terminal
alias la='ls -all'  # Display list of file with all information
alias q='exit'  # Exit terminal
alias sl='ls'  # Avoid spelling mistake
alias h='history'  # Show history
alias cp="cp -i"  # Confirm before overwriting something
alias rm='rm -iv' # Confirm before removing something
alias terminator='terminator --geometry 1000x750+850+100' # Resize Terminator

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
alias ccomp='gcc -Wall -Wextra -Werror -std=c99 -O1 -o'

# Redshift
alias red='redshift -O 4000 -b 0.8'
alias redl='redshift -O 3500 -b 0.6'
alias redh='redshift -O 5500 -b 0.9'
alias redx='redshift -x'

# Misc
alias lol='fortune | cowsay | lolcat'
