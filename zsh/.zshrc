# Load aliases
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

export PATH="/opt/homebrew/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# kubectl completion
source <(kubectl completion zsh)

# History setting
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt auto_pushd
setopt pushd_ignore_dups
setopt globdots
setopt append_history
setopt extended_history
setopt share_history
setopt print_eight_bit

# fzf history
function fzf-select-history() {
    local selected="$(history -inr 1 | fzf --exit-0 --query "$LBUFFER" --reverse | cut -d' ' -f4-)"
    if [ -n "$selected" ]; then
        BUFFER="$selected"
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# Seach and tansit to repo by ghq
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf

# zoxide
eval "$(zoxide init zsh --hook prompt )"

# Load sheldon
eval "$(sheldon source)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
