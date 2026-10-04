#!/bin/sh

set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_dir="$script_dir/config"

stow -R --no-folding --dotfiles --target "$HOME" --dir "$config_dir" herdr
stow -R --dotfiles --target "$HOME" --dir "$config_dir" bin bluetui btop ghostty gtk-3.0 home mise rofi sway opencode waybar nvim

# Prefer dark mode for modern applications and older GTK applications.
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
