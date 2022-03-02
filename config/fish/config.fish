if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    mcfly init fish | source

    # Linux
    if test -f ~/.asdf/asdf.fish
        source ~/.asdf/asdf.fish
    end

    # Macbook
    if test -f /usr/local/opt/asdf/libexec/asdf.fish
        source /usr/local/opt/asdf/libexec/asdf.fish
    end

    # Colorscheme
    source ~/.config/fish/colorschemes/catppuccin.fish

end

set -gx MANPAGER /usr/local/bin/nvim +Man!
function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# opam configuration
source /home/jlopez/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/jlopez/.ghcup/bin $PATH # ghcup-env
fzf_configure_bindings --git_log=\cg --git_status=\eg --directory=\cf --history --variables --processes=\ej
