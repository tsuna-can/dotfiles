SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Create symbolic link to settings.json
if [ -L "${HOME}/Library/Application\ Support/Code/User/settings.json" ]; then
  ln -fsvn "${SCRIPT_DIR}/settings.json" "${HOME}/Library/Application\ Support/Code/User/settings.json"
fi

# Create symbolic link to keybindings.json
if [ -L "${HOME}/Library/Application\ Support/Code/User/keybindings.json" ]; then
  ln -fsvn "${SCRIPT_DIR}/keybindings.json" "${HOME}/Library/Application\ Support/Code/User/keybindings.json"
fi

