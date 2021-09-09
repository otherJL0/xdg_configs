export VISUAL=nvim
export EDITOR=nvim

source $ZDOTDIR/env/go.zsh
source $ZDOTDIR/env/cmake.zsh

typeset -U PATH path
path+=(
"$HOME/.local/bin"
"$HOME/.local/share/coursier/bin"
"$GOBIN" 
"$HOME/.cargo/bin"
"$HOME/.jbang/bin"
"$HOME/.jbang/currentjdk/bin"
"$HOME/.ghcup/bin"
"$HOME/.yarn/bin"
"$HOME/.deno/bin"
"$HOME/bin"
)
export PATH


export JAVA_HOME="/home/jlopez/.cache/coursier/jvm/openjdk@1.11.0-2"
export PATH="$PATH:/home/jlopez/.cache/coursier/jvm/openjdk@1.11.0-2/bin"

eval $(opam env)
