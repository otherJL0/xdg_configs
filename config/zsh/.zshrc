autoload -Uz compinit
compinit

# Source Zsh Options
source ${XDG_CONFIG_HOME}/zsh/zshopts

# Source Zsh Aliases
source ${XDG_CONFIG_HOME}/zsh/zshaliases

# Source Zsh Completions
source ${XDG_CONFIG_HOME}/zsh/zshcompletions
#
# Source Zsh Command Line Editing
source ${XDG_CONFIG_HOME}/zsh/line_editor.zsh

eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# rose pine colors
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0403c58
  \e]P1ea6f91
  \e]P29bced7
  \e]P3f1ca93
  \e]P434738e
  \e]P5c3a5e6
  \e]P6eabbb9
  \e]P7faebd7
  \e]P86f6e85
  \e]P9ea6f91
  \e]PA9bced7
  \e]PBf1ca93
  \e]PC34738e
  \e]PDc3a5e6
  \e]PEeabbb9
  \e]PFffffff
  "
  # get rid of artifacts
  clear
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jlopez/.local/share/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jlopez/.local/share/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/jlopez/.local/share/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/jlopez/.local/share/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

