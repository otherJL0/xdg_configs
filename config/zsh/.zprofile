typeset -U PATH path
path+=("$HOME/.local/bin" "$HOME/.local/share/coursier/bin")
export PATH

export VISUAL=nvim
export EDITOR=nvim

# export GOENV=$XDG_CONFIG_HOME/go/zshenv

source $ZDOTDIR/env/go.zsh

typeset -U PATH path
path+=("$HOME/.local/bin" "$HOME/.local/share/coursier/bin" "$GOBIN")
export PATH
