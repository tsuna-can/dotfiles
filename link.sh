#!/bin/zsh

# Function to create a symbolic link if the file does not exist
create_symlink() {
  local target_file="$1"
  local link_name="$2"

  if [ -e "$link_name" ]; then
    echo "File or directory $link_name already exists. Skipping..."
  else
    ln -fsv "${PWD}/${target_file}" "$link_name"
  fi
}

# Create symbolic links
create_symlink "zsh/.zshrc" "${HOME}/.zshrc"
create_symlink "zsh/.zsh_aliases" "${HOME}/.zsh_aliases"
create_symlink "zsh/.zsh_functions" "${HOME}/.zsh_functions"
create_symlink ".wezterm.lua" "${HOME}/.wezterm.lua"
create_symlink ".hammerspoon" "${HOME}/.hammerspoon"
create_symlink ".ideavimrc" "${HOME}/.ideavimrc"
create_symlink ".config/nvim" "${HOME}/.config/nvim"
create_symlink ".config/sheldon" "${HOME}/.config/sheldon"
create_symlink ".config/starship.toml" "${HOME}/.config/starship.toml"

