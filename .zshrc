export LANG=ja_JP.UTF-8

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

autoload -Uz compinit && compinit -C

if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
    eval "$(mise completion zsh)"
fi

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

if command -v jj >/dev/null 2>&1; then
    source <(COMPLETE=zsh jj)
fi

typeset -U path PATH

if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [[ "$(uname)" == "Linux" && -d "$HOME/.local/bin/nvim-linux-x86_64/bin" ]]; then
    export PATH="$HOME/.local/bin/nvim-linux-x86_64/bin:$PATH"
fi
