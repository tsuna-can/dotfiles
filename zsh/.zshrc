# Load aliases
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# Load functions
if [ -f ~/.zsh_functions ]; then
  source ~/.zsh_functions
fi

# To use nvim in edit-command-line
EDITOR=nvim

export PATH="/opt/homebrew/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# History setting
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups
setopt globdots
setopt append_history
setopt extended_history
setopt share_history
setopt print_eight_bit

# Load sheldon
eval "$(sheldon source)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

