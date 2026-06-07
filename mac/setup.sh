#!/bin/sh

# Install Homebrew
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install programs
brew bundle install
mise install

# Stow dotfiles
stow -R --dotfiles --ignore=.DS_Store --target ~ --dir=config home lazygit nvim aerospace tmux mise
stow -R --ignore=.DS_Store --target ~/.local/bin --dir=.. bin
