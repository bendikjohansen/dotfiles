#!/bin/zsh

export PATH=/opt/homebrew/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=nvim

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)

alias vim=nvim
alias cat=bat
