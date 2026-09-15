#!/bin/sh

set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_dir="$script_dir/config"

stow --adopt -R --dotfiles --target "$HOME" --dir "$config_dir" \
  home bin bluetui ghostty gtk-3.0 herdr mise opencode rofi sway waybar
