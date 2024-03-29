if status is-interactive
    if test ( uname ) = Darwin
        fish_add_path -P /opt/homebrew/bin
    end


    source (brew --prefix asdf)/libexec/asdf.fish

    # Direnv settings
    set -gx direnv_fish_mode eval_on_arrow
    # set -gx direnv_fish_mode eval_after_arrow
    # set -gx direnv_fish_mode disable_arrow
    # asdf exec direnv hook fish | source

    fzf_configure_bindings --git_log=\cg --git_status=\eg --directory=\cf --history --variables --processes=\ej

    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    atuin init fish | source
    cue completion fish | source


    set -gx PATH $PATH $HOME/.krew/bin
end

set -gx MANPAGER nvim +Man!
function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert

    set -Ux fish_cursor_default block
    set -Ux fish_cursor_insert line
    set -Ux fish_cursor_replace_one underscore
    set -Ux fish_cursor_visual block

end

# opam configuration
source /home/jlopez/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/jlopez/.ghcup/bin $PATH # ghcup-env


set -U fish_greeting
set -gx EDITOR nvim
set -gx VISUAL nvim
# XDG Configuration
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

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
fish_add_path -P /usr/local/bin/

function add_tea_environment --on-variable PWD
    tea -Eds | source
end #tea

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Setting PATH for Python 3.8
# The original version is saved in /Users/jolopez/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.8/bin" "$PATH"

alias assume="source /opt/homebrew/opt/granted/bin/assume.fish"

# Setting PATH for Python 3.10
# The original version is saved in /Users/jolopez/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

[ -f ~/.inshellisense/key-bindings.fish ] && source ~/.inshellisense/key-bindings.fish