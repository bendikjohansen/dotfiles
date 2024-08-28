source $HOME/.antidote/antidote.zsh
antidote load

eval "$(starship init zsh)"

source <(fzf --zsh)

alias vim=nvim

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
