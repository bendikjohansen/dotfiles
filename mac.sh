#!/bin/zsh

if [ ! -d /opt/homebrew ]; then
    echo "Installing Homebrew..."
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed."
fi
brew bundle --no-upgrade --no-lock --quiet

if [ ! -d $HOME/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

if ! [ -f /Library/Fonts/HackNerdFontMono-Regular.ttf ]; then
    wget --output-document /Library/Fonts/hack-nerd-font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
    unzip /Library/Fonts/hack-nerd-font.zip -d /Library/Fonts
fi

defaults write com.apple.screencapture target -string clipboard
