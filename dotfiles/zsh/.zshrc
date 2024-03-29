##===========================================================================##
#                                *** ZSH ***                                  #
##===========================================================================##

# Path to oh-my-zsh installation
case `uname -r | tr '[:upper:]' '[:lower:]'` in
    *manjaro*)
        export ZSH="/home/ewael/.oh-my-zsh"
    ;;
    *kali*)
        export ZSH="/root/.oh-my-zsh"
    ;;
esac

# You can find more standard themes in ~/.oh-my-zsh/themes/*
ZSH_THEME="custom"

# Browser
export BROWSER="/usr/bin/google-chrome-stable"

# You can find more standard plugins in ~/.oh-my-zsh/plugins/*
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# Uncomment the following line to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment the following line to display dots whilst waiting for completion
# COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# Display infos
neofetch

##===========================================================================##
#                             *** TERMINAL ***                                #
##===========================================================================##

# Make vim you default editor
export EDITOR=vim

# Colored LS style when pressing `TAB` for suggestions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

##===========================================================================##
#                               *** ALIAS ***                                 #
##===========================================================================##

# System
case `uname -r | tr '[:upper:]' '[:lower:]'` in
    *manjaro*)
        alias install='sudo pacman -Suy'  # Install package on arch base distro
        alias update='sudo pacman -Syu'  # Update package on arch base distro
        alias remove='sudo pacman -Rcns'  # Remove package on arch base distro
    ;;
    *kali*)
        alias install='sudo apt install'
        alias remove='sudo apt remove'
        alias update='sudo apt update'
        alias upgrade='sudo apt upgrade'
        alias autoremove='sudo apt autoremove'
        alias dist-upgrade='sudo apt dist-upgrade'
        alias fresh='update && upgrade && autoremove && dist-upgrade'
    ;;
esac

# Common
alias la='ls -all'  # Display list of file with all information
alias lsd='ls -d $PWD/*'  # List files with their full path
alias sl='ls'  # Avoid spelling mistake
alias cp='cp -i'  # Confirm before overwriting something
alias rm='rm -iv'  # Confirm before removing something

# Git
alias gst='git status'
alias gcmsg='git commit -m'
alias ga='git add'
alias gp='git push'
alias gl='git pull'
alias gt='git tag'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --oneline --graph --decorate'  # Nice display of git log

# C
alias mygcc='gcc -Wall -Wextra -Werror -std=c99 -O1 -o'
alias myg++='g++ -Wall -Wextra -Werror -pedantic -std=c++17 -o'
alias myclang++='clang++ -Wall -Wextra -Werror -pedantic -std=c++17 -o'

# Redshift
alias red='redshift -O 4000 -b 0.8'
alias redl='redshift -O 3500 -b 0.6'
alias redh='redshift -O 5500 -b 0.9'
alias redx='redshift -x'
