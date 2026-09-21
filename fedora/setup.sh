#!/bin/sh

set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_dir="$script_dir/config"

stow -R --no-folding --dotfiles --target "$HOME" --dir "$config_dir" herdr
stow -R --dotfiles --target "$HOME" --dir "$config_dir" bin bluetui ghostty gtk-3.0 home mise rofi sway opencode waybar nvim
