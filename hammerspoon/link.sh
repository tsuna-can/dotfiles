#!/bin/zsh

# dir-level symlink: ~/.hammerspoon -> dotfiles/hammerspoon/
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ln -sfv "${DOTFILES_DIR}/hammerspoon" "${HOME}/.hammerspoon"
