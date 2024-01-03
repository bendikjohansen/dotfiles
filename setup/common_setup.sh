#!/bin/bash

mkdir -p ~/.config

ln -sf ~/.dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/alacritty ~/.config/alacritty

