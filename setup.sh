# ideavim
ln -fs ${PWD}/.ideavimrc ~/.ideavimrc

# zsh
ln -fs ${PWD}/.zshrc ~/.zshrc

# wezterm
ln -fs ${PWD}/.wezterm ~/.wezterm

# .config
SOURCE_DIR="${PWD}/.config"
TARGET_DIR="${HOME}/.config"

for ITEM in "$SOURCE_DIR"/*; do
  BASENAME=$(basename "$ITEM")
  TARGET_ITEM="$TARGET_DIR/$BASENAME"

  ln -fs $ITEM $TARGET_ITEM
done

