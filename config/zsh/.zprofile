export VISUAL=nvim
export EDITOR=nvim

source $ZDOTDIR/env/go.zsh

typeset -U PATH path
path+=(
"$HOME/.local/bin"
"$HOME/.local/share/coursier/bin"
"$GOBIN" 
"$HOME/.cargo/bin"
"$HOME/.jbang/bin"
)
export PATH


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export JAVA_HOME="/home/jlopez/.cache/coursier/jvm/openjdk@1.11.0-2"
export PATH="$PATH:/home/jlopez/.cache/coursier/jvm/openjdk@1.11.0-2/bin"
