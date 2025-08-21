#!/bin/sh

## Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Stow dotfiles
stow -R --dotfiles --ignore=.DS_Store --target ~ --dir=config home lazydocker lazygit nvim
