set -U fish_greeting
# XDG Configuration
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# Rust
set -gx RUSTUP_HOME $HOME/.rustup
set -gx RUSTUP_TOOLCHAIN nightly-x86_64-unknown-linux-gnu
set -ga fish_user_paths $RUSTUP_HOME/toolchains/$RUSTUP_TOOLCHAIN/bin

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
set -ga fish_user_paths $COURSIER_DATA/bin

# Clang
set -gx CC clang
set -gx CXX clang++

# CMake
set -gx CMAKE_EXPORT_COMPILE_COMMANDS 1
set -gx CMAKE_BUILD_TYPE Release
set -gx CMAKE_DISABLE32BIT ON


# Golang
set -gx GOBIN $HOME/.go/bin
set -gx GOCACHE $XDG_CACHE_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/gomod
set -gx fish_user_paths $GOBIN


# user path
fish_add_path -pP $HOME/.local/bin
fish_add_path -pP $HOME/.cargo/bin
fish_add_path -pP $HOME/.jbang/bin
fish_add_path -pP $HOME/.jbang/currentjdk/bin
fish_add_path -pP $HOME/.ghcup/bin
fish_add_path -pP $HOME/.yarn/bin
fish_add_path -pP $HOME/.deno/bin
fish_add_path -pP $HOME/bin
fish_add_path -pP $HOME/.luarocks/bin
fish_add_path -pP ./node_modules/.bin
fish_add_path -pP ./.venv/bin
fish_add_path -pP $HOME/.cache/coursier/jvm/openjdk@1.11.0-2/bin
fish_add_path -pP $HOME/.cache/nvim/packer_hererocks/2.1.0-beta3/bin
