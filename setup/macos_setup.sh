#!/bin/zsh

source $HOME/.dotfiles/setup/common_setup.sh

if [ ! -d $HOME/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

if ! command -v starship > /dev/null; then
    brew install starship
fi

if ! command -v delta > /dev/null; then
    brew install git-delta
fi

if ! command -v act > /dev/null; then
    brew install act
fi

if ! command -v gcloud > /dev/null; then
    pushd $HOME
    if ! [ -d google-cloud-sdk ]; then
        wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-459.0.0-darwin-arm.tar.gz
        tar xf google-cloud-cli-459.0.0-darwin-arm.tar.gz
        rm google-cloud-cli-459.0.0-darwin-arm.tar.gz
    fi
    cd google-cloud-sdk
    ./install.sh --usage-reporting=false --screen-reader=false --rc-path=false --command-completion=false --path-update=false --install-python=false
    popd
fi

if ! [ -d /Library/Fonts/hack-nerd-font ]; then
    wget --output-document /Library/Fonts/hack-nerd-font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
    unzip /Library/Fonts/hack-nerd-font.zip -d /Library/Fonts
fi


defaults write com.apple.screencapture target -string clipboard
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -string clipboard
defaults write com.apple.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -string clipboard

killall SystemUIServer

source $HOME/.zshrc
