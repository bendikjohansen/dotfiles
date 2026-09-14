#!/usr/bin/env zsh

VM_DIR="$HOME/Documents/VMs"

# List .conf files, show just the VM name (no path, no extension)
selection=$(find "$VM_DIR" -maxdepth 1 -name '*.conf' -printf '%f\n' |
  sed 's/\.conf$//' |
  sort |
  rofi -dmenu --prompt "Launch VM")

[ -z "$selection" ] && exit 0 # nothing picked, bail out

# IMPORTANT: cd into the dir first (see note below)
cd "$VM_DIR" || exit 1
quickemu --vm "${selection}.conf"
