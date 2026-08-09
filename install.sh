#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config

ln -sfvn "$DOTFILES_DIR/mise" ~/.config/mise
ln -sfvn "$DOTFILES_DIR/wezterm" ~/.config/wezterm
ln -sfvn "$DOTFILES_DIR/nvim" ~/.config/nvim
ln -sfvn "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml
ln -sfv "$DOTFILES_DIR/.zshrc" ~/.zshrc

if command -v mise >/dev/null 2>&1; then
    mise install
fi
