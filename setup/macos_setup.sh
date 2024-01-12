#!/bin/zsh

source $HOME/.dotfiles/setup/common_setup.sh

if ! command -v starship > /dev/null; then
    brew install starship
fi

if ! command -v delta > /dev/null; then
    brew install git-delta
fi

defaults write com.apple.screencapture target -string clipboard
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -string clipboard
defaults write com.apple.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -string clipboard

killall SystemUIServer

source $HOME/.zshrc
