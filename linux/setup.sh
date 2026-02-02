#!/bin/sh

# Stow dotfiles
stow -R --dotfiles --target ~ --dir=config alacritty applications btop home mise nvim sway
