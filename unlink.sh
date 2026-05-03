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

# nvim (pre-migration): dir-level symlink to dotfiles/.config/nvim
remove_dotfiles_config_symlink "${HOME}/.config/nvim"

# wezterm (pre-migration): was dotfiles/.wezterm.lua (root)
if [ -L "${HOME}/.wezterm.lua" ] && [[ "$(readlink "${HOME}/.wezterm.lua")" == "$DOTFILES_DIR/.wezterm.lua" ]]; then
  unlink "${HOME}/.wezterm.lua"
  echo "Unlinked: ${HOME}/.wezterm.lua"
else
  echo "Skipping '${HOME}/.wezterm.lua': not a pre-migration dotfiles symlink"
fi

# ideavim (pre-migration): was dotfiles/.ideavimrc (root)
if [ -L "${HOME}/.ideavimrc" ] && [[ "$(readlink "${HOME}/.ideavimrc")" == "$DOTFILES_DIR/.ideavimrc" ]]; then
  unlink "${HOME}/.ideavimrc"
  echo "Unlinked: ${HOME}/.ideavimrc"
else
  echo "Skipping '${HOME}/.ideavimrc': not a pre-migration dotfiles symlink"
fi

# hammerspoon (pre-migration): was dotfiles/.hammerspoon (root)
if [ -L "${HOME}/.hammerspoon" ] && [[ "$(readlink "${HOME}/.hammerspoon")" == "$DOTFILES_DIR/.hammerspoon" ]]; then
  unlink "${HOME}/.hammerspoon"
  echo "Unlinked: ${HOME}/.hammerspoon"
else
  echo "Skipping '${HOME}/.hammerspoon': not a pre-migration dotfiles symlink"
fi
