#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Function to create a symbolic link if the file does not exist
create_symlink() {
  local target_file="$1"
  local link_name="$2"

  if [ -e "$link_name" ]; then
    echo "File or directory '$link_name' already exists. Skipping..."
  else
    ln -fsv "$target_file" "$link_name"
  fi
}

mkdir -p "${HOME}/.claude/hooks"
create_symlink "${SCRIPT_DIR}/settings.json" "${HOME}/.claude/settings.json"
create_symlink "${SCRIPT_DIR}/statusline.sh" "${HOME}/.claude/statusline.sh"
create_symlink "${SCRIPT_DIR}/hooks/stop-notify.sh" "${HOME}/.claude/hooks/stop-notify.sh"
