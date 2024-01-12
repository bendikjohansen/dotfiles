#!/bin/zsh

export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.dotfiles/bin

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

alias vim=nvim

