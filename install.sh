#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v fish >/dev/null 2>&1; then
    echo "fish is not installed."
    echo "Please install fish first, for example on Ubuntu:"
    echo "  sudo apt update && sudo apt install -y fish"
    exit 1
fi

mkdir -p "$HOME/.config"

if [ -e "$HOME/.config/fish" ] || [ -L "$HOME/.config/fish" ]; then
    BACKUP_PATH="$HOME/.config/fish.backup.$(date +%Y%m%d%H%M%S)"
    echo "Backing up existing fish config to:"
    echo "  $BACKUP_PATH"
    mv "$HOME/.config/fish" "$BACKUP_PATH"
fi

ln -s "$DOTFILES_DIR/fish" "$HOME/.config/fish"

echo "Fish config linked successfully:"
echo "  $HOME/.config/fish -> $DOTFILES_DIR/fish"
echo
echo "Restart your shell or run:"
echo "  exec fish"
