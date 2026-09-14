#!/bin/zsh

export PATH=$PATH:$HOME/.local/bin
export EDITOR=nvim
export MANPAGER='nvim +Man!'
export XDG_CONFIG_HOME="$HOME/.config"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

alias vim=nvim

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP
bindkey -e

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
source <(fzf --zsh)
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
