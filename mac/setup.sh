#!/bin/sh

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install programs
brew bundle install
mise use -g node
mise use -g dotnet
mise use -g java@21

# Stow dotfiles
stow -R --dotfiles --ignore=.DS_Store --target ~ --dir=config home lazydocker lazygit nvim aerospace
