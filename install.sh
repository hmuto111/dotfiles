#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.config

link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ "$(readlink -f "$dest")" = "$src" ]; then
            return
        fi
        rm -rf "$dest"
    fi

    ln -sfn "$src" "$dest"
}

link_file "$DOTFILES_DIR/mise" "$HOME/.config/mise"
link_file "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
link_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

if command -v mise >/dev/null 2>&1; then
    mise install
fi
