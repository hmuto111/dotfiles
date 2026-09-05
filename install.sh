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

# Jujutsu (初回のみコピー配置してローカル変更・個別設定と分離)
mkdir -p "$HOME/.config/jj"
if [ ! -f "$HOME/.config/jj/config.toml" ]; then
    cp "$DOTFILES_DIR/jj/config.toml" "$HOME/.config/jj/config.toml"
fi

# Antigravity CLI (初回のみコピー配置してローカル変更と分離)
mkdir -p "$HOME/.gemini/antigravity-cli"
if [ ! -f "$HOME/.gemini/antigravity-cli/settings.json" ]; then
    cp "$DOTFILES_DIR/agy/settings.json" "$HOME/.gemini/antigravity-cli/settings.json"
fi

if command -v mise >/dev/null 2>&1; then
    mise install
    mise bootstrap
fi

