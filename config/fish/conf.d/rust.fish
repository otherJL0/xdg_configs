
# Rust
set -gx RUSTUP_HOME $HOME/.rustup

if test ( uname ) = Darwin
    set -gx RUSTUP_TOOLCHAIN stable-aarch64-apple-darwin
    fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/nightly-aarch64-apple-darwin/bin
else
    set -gx RUSTUP_TOOLCHAIN stable-x86_64-unknown-linux-gnu
    fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/nightly-x86_64-unknown-linux-gnu/bin
end
fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/$RUSTUP_TOOLCHAIN/bin
