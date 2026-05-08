# Mac dotfiles

A simple mac setup that prefers simple and good enough to powerful, but complex.

## Overview

- This setup relies on homebrew and Brewfile to install all packages.
- Dotfiles are symlinked to the home directory using `GNU Stow`.
- The setup process can be found in `./setup.sh`. It is important this is always up to date.

### config directory

- `config/aerospace` - configuration for the tiling window manager
- `config/home` - configuration for dotfiles in the home directory
- `config/lazygit` - configuration for the Git TUI of choice
- `config/nvim` - configuration for nvim based on LazyVim
- `config/tmux` - configration for the terminal multiplexer

## Conventions

- Prefer folders within `$HOME/.config/` to dotfiles in the home directory.
