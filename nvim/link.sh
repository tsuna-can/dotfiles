#!/bin/zsh

# dir-level symlink: ~/.config/nvim -> dotfiles/nvim/
DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ln -sfv "${DOTFILES_DIR}/nvim" "${HOME}/.config/nvim"
