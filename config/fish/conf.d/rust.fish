
# Rust
set -gx RUSTUP_HOME $HOME/.rustup

if test ( uname ) = Darwin
    set -gx RUSTUP_TOOLCHAIN stable-x86_64-apple-darwin
    fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/nightly-x86_64-apple-darwin/bin
else
    set -gx RUSTUP_TOOLCHAIN stable-x86_64-unknown-linux-gnu
    fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/nightly-x86_64-unknown-linux-gnu/bin
end
fish_add_path --prepend --path --global $RUSTUP_HOME/toolchains/$RUSTUP_TOOLCHAIN/bin
set -gx RUSTC_WRAPPER sccache
# set -ga fish_user_paths $RUSTUP_HOME/toolchains/$RUSTUP_TOOLCHAIN/bin
