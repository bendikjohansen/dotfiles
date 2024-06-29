#!/bin/zsh

if [ ! -d /opt/homebrew ]; then
    echo "Installing Homebrew..."
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed."
fi
brew bundle --no-upgrade --no-lock --quiet
if [ ! -d $HOME/.zsh/zsh-autosuggestions ]; then
    # TODO: Add as a git submodule
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

if ! [ -f /Library/Fonts/nerd-font.zip ]; then
    wget --output-document /Library/Fonts/nerd-font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
    unzip /Library/Fonts/nerd-font.zip -d /Library/Fonts
fi

defaults write com.apple.screencapture target -string clipboard
