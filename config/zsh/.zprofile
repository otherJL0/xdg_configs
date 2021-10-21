export VISUAL=nvim
export EDITOR=nvim

export MANPAGER='nvim +Man!'

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
"$HOME/.luarocks/bin"
"$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin"
)
export PATH


export JAVA_HOME="/home/jlopez/.cache/coursier/jvm/openjdk@1.11.0-2"
export PATH="$PATH:/home/jlopez/.cache/coursier/jvm/openjdk@1.11.0-2/bin"

# Neovim 
export PACKER_START="${XDG_DATA_HOME}/nvim/site/pack/packer/start"
export PACKER_OPT="${XDG_DATA_HOME}/nvim/site/pack/packer/opt"
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=true
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_RESULTS_SORT=LAST_RUN


eval "$(mcfly init zsh)"
eval "$(opam env)"
eval "$(zoxide init zsh)"
