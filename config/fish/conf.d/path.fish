set -U fish_greeting
set -gx EDITOR nvim
set -gx VISUAL nvim
# XDG Configuration
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# Neovim paths
set -gx NVIM_DATA $XDG_DATA_HOME/nvim
set -gx NVIM_CACHE $XDG_CACHE_HOME/nvim
set -gx PACKER_DIR $NVIM_DATA/site/pack/packer
set -gx PACKER_START $PACKER_DIR/start
set -gx PACKER_OPT $PACKER_DIR/opt

# Java/Coursier
set -gx JVM_VENDOR openjdk
set -gx JVM_VERSION 1.11.0-2
set -gx COURSIER_CACHE $XDG_CACHE_HOME/coursier
set -gx COURSIER_DATA $XDG_DATA_HOME/coursier
set -gx JAVA_HOME $COURSIER_CACHE/jvm/$JVM_VENDOR@$JVM_VERSION
fish_add_path -P $COURSIER_DATA/bin
# set -ga fish_user_paths $COURSIER_DATA/bin

# Clang
set -gx AOCC_HOME /opt/AMD/aocc-compiler-3.2.0
if test -d $AOCC_HOME
    set -gx CC "$AOCC_HOME/bin/clang -march=znver3"
    set -gx CXX "$AOCC_HOME/bin/clang++ -march=znver3"
else
    set -gx CC clang
    set -gx CXX clang++
end

# CMake
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1
set -gx CMAKE_BUILD_TYPE Release
set -gx CMAKE_DISABLE32BIT ON


# Golang
set -gx GOBIN $HOME/.go/bin
set -gx GOCACHE $XDG_CACHE_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/gomod
fish_add_path --prepend --path --global $GOBIN
# set -gx fish_user_paths $GOBIN


# user path
fish_add_path -P $HOME/.local/bin
fish_add_path -P $HOME/.cargo/bin
fish_add_path -P $HOME/.jbang/bin
fish_add_path -P $HOME/.jbang/currentjdk/bin
fish_add_path -P $HOME/.ghcup/bin
fish_add_path -P $HOME/.yarn/bin
fish_add_path -P $HOME/.deno/bin
fish_add_path -P $HOME/bin
fish_add_path -P $HOME/.luarocks/bin
fish_add_path -P ./node_modules/.bin
fish_add_path -P ./.venv/bin
fish_add_path -P $HOME/.cache/coursier/jvm/openjdk@1.11.0-2/bin
fish_add_path -P $HOME/.cache/nvim/packer_hererocks/2.1.0-beta3/bin

# Rust
set -gx RUSTUP_HOME $HOME/.rustup
set -gx RUSTUP_TOOLCHAIN nightly-x86_64-unknown-linux-gnu
fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/$RUSTUP_TOOLCHAIN/bin
# set -ga fish_user_paths $RUSTUP_HOME/toolchains/$RUSTUP_TOOLCHAIN/bin
