#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "${HOME}/.config/ghostty"
ln -sfv "${DOTFILES_DIR}/ghostty/config" "${HOME}/.config/ghostty/config"
