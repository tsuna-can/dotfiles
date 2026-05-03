#!/bin/zsh

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ln -sfv "${DOTFILES_DIR}/wezterm/.wezterm.lua" "${HOME}/.wezterm.lua"
