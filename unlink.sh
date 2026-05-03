#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Remove a symlink only if it points into dotfiles/.config/
remove_dotfiles_config_symlink() {
  local link_path="$1"
  if [ -L "$link_path" ] && [[ "$(readlink "$link_path")" == "$DOTFILES_DIR/.config/"* ]]; then
    unlink "$link_path"
    echo "Unlinked: $link_path"
  else
    echo "Skipping '$link_path': not a dotfiles/.config symlink"
  fi
}

remove_dotfiles_config_symlink "${HOME}/.config/starship.toml"

# ghostty (pre-migration): config was in dotfiles/.config/ghostty/
remove_dotfiles_config_symlink "${HOME}/.config/ghostty/config"

# sheldon (pre-migration): dir-level symlink to dotfiles/.config/sheldon
remove_dotfiles_config_symlink "${HOME}/.config/sheldon"
