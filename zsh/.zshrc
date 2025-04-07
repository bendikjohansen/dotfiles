#!/bin/zsh

PATH=$PATH:/opt/homebrew/bin
PATH=$PATH:~/dotfiles/bin
PATH=$PATH:~/.dotnet/tools

export XDG_CONFIG_HOME="$HOME/.config"
# export JAVA_HOME="$(brew --prefix openjdk)"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
export NVM_DIR="$HOME/.nvm"

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

alias cat=bat
alias ls=eza
alias vim=nvim

autoload -Uz compinit && compinit

source <(fzf --zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
command -v flux >/dev/null && . <(flux completion zsh)

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"


source /Users/bmj/.config/broot/launcher/bash/br
