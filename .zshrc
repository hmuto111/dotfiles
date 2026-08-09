export LANG=ja_JP.UTF-8

# --------------------------------------------------
# 1. Homebrew の初期化 (OS・アーキテクチャ別のパス判定)
# --------------------------------------------------
if [[ -x /opt/homebrew/bin/brew ]]; then
    # macOS (Apple Silicon)
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    # macOS (Intel)
    eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    # Linux
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# --------------------------------------------------
# 2. 開発ツールの有効化 (コマンドの存在を確認して実行)
# --------------------------------------------------
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
    eval "$(mise completion zsh)"
fi

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# --------------------------------------------------
# 3. PATH の設定
# --------------------------------------------------
# PATH内の重複登録を自動的に防止
typeset -U path PATH

# 汎用ローカルバイナリパス (Antigravity CLI等含む)
if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Linux専用バイナリのパス (Linuxかつ対象ディレクトリが存在する場合のみ追加)
if [[ "$(uname)" == "Linux" && -d "$HOME/.local/bin/nvim-linux-x86_64/bin" ]]; then
    export PATH="$HOME/.local/bin/nvim-linux-x86_64/bin:$PATH"
fi
