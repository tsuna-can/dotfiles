#!/bin/bash

# Devcontainer setup script

echo "--------- Start installation ---------"

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz lazygit

echo "--------- Lazygit installed ---------"

cd ~/
ln -fs ~/dotfiles/zsh/.zsh_aliases ~/.bashrc

echo "--------- Aliases linked ---------"
echo "--------- Installation completed ---------"

