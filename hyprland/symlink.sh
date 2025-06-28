#!/usr/bin/env bash
set -euo pipefail

SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_NAME="$(basename "$SCRIPT_PATH")"

SRC_DIR=$(pwd)
echo $SRC_DIR
# Destination: Hyprland’s config dir in your home
TARGET_DIR="$HOME/.config/hypr"

# Create the ~/.config/hypr directory if needed
mkdir -p "$TARGET_DIR"

# Loop over everything in SRC_DIR (including dot-files), skip “.” & “..”
for ITEM in "$SRC_DIR"/.* "$SRC_DIR"/*; do
  [ -e "$ITEM" ] || continue                   # skip if no match
  BASENAME="$(basename "$ITEM")"
  [[ "$BASENAME" == "." || "$BASENAME" == ".." ]] && continue

  if [ "$(realpath "$ITEM")" = "$SCRIPT_PATH" ] || [ "$BASENAME" = "$SCRIPT_NAME" ]; then
    echo "Skipping script file: $BASENAME"
    continue
  fi

  # -s : symlink
  # -f : remove existing destination file/symlink if present
  # -n : treat destination that’s a symlink to a directory as a normal file
  ln -sfnv "$ITEM" "$TARGET_DIR/$BASENAME"
done

