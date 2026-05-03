#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "${HOME}/.config/sheldon"
ln -sfv "${DOTFILES_DIR}/sheldon/plugins.toml" "${HOME}/.config/sheldon/plugins.toml"
