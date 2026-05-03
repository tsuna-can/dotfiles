#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ln -sfv "${DOTFILES_DIR}/starship/starship.toml" "${HOME}/.config/starship.toml"
