#!/bin/sh

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle install
mise use -g node
mise use -g dotnet
mise use -g java@21

## Stow dotfiles
stow -R --dotfiles --ignore=.DS_Store --target ~ --dir=config home lazydocker lazygit nvim
