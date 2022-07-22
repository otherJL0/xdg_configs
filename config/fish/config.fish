if status is-interactive
    if test ( uname ) = Darwin
        fish_add_path -P /opt/homebrew/bin
    end
    # Linux
    if test -f ~/.asdf/asdf.fish
        source ~/.asdf/asdf.fish
    end

    # Macbook
    set asdf_source /opt/homebrew/opt/asdf/libexec/asdf.fish
    if test -f $asdf_source
        source $asdf_source
    end

    # Colorscheme
    source ~/.config/fish/colorschemes/mocha.fish

    # Direnv settings
    set -gx direnv_fish_mode eval_on_arrow
    # set -gx direnv_fish_mode eval_after_arrow
    # set -gx direnv_fish_mode disable_arrow
    asdf exec direnv hook fish | source

    fzf_configure_bindings --git_log=\cg --git_status=\eg --directory=\cf --history --variables --processes=\ej

    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    mcfly init fish | source

    # if test ( uname ) = Darwin
    #     if contains voxsupFrontend2 (string split '/' $PWD)
    #         fnm env --use-on-cd | source
    #     end
    # end

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
