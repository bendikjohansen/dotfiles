#!/bin/bash

mkdir -p ~/.config

ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/.dotfiles/nvim ~/.config
ln -sf ~/.dotfiles/alacritty ~/.config
ln -sf ~/.dotfiles/starship/starship.toml ~/.config
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux ~/.config

if [ ! -d $HOME/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

