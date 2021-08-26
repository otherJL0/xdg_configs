export VISUAL=nvim
export EDITOR=nvim

source $ZDOTDIR/env/go.zsh

typeset -U PATH path
path+=("$HOME/.local/bin" "$HOME/.local/share/coursier/bin" "$GOBIN" "$HOME/.cargo/bin")
export PATH


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
