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
source ${XDG_CONFIG_HOME}/zsh/zshcli

eval "$(starship init zsh)"
