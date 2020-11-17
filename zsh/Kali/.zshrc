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

# Uncomment the following line to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment the following line to display dots whilst waiting for completion
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh


##===========================================================================##
#                             *** TERMINAL ***                                #
##===========================================================================##

# Display an ascii art when opening terminal. Replace 'path' by the location of
# your ascii art file
# cat path

# Set keyboard layout to us with accent and capslock replace with escape
# setxkbmap -layout us -variant intl -option caps:escape

# Set keyboard layout to standart us with capslock replace with escape
# setxkbmap us -option caps:escape

# Make vim you default editor
export EDITOR=vim

# Display system info using neofetch
neofetch --ascii_distro arch

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
# Active dual screen on i3. This may not work on all computer
alias screen='xrandr --output HDMI-2 --mode 1920x1080 --same-as eDP-1'

# Terminal
alias c='clear'  # Clear current terminal tab
alias la='ls -all'  # Display list of file with all information
alias q='exit'  # Exit terminal
alias ..='cd ..'
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
alias gc='git commit -m'
alias gp='git push'
alias g='git'
alias gt='git tag'
alias coolog='git log --graph --decorate'  # Nice display of git log

# C
alias ccomp='gcc -Wall -Wextra -Werror -std=c99 -O1 -o'

# Redshift
alias redl='redshift -O 3500 -b 0.6'
alias redh='redshift -O 6000 -b 0.8'
alias redx='redshift -x'

# Misc
alias lol='fortune | cowsay | lolcat'


##===========================================================================##
#                             *** FUNCTION ***                                #
##===========================================================================##

# Git quick: gq name_of_commit
gq() {
	git status
	git add -A
	git commit -m "$1"
	git push
	git status
};
