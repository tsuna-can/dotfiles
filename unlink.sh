#!/bin/zsh

# ghostty: remove file symlink inside real dir, then remove dir
rm -f "${HOME}/.config/ghostty/config"
rmdir "${HOME}/.config/ghostty"
