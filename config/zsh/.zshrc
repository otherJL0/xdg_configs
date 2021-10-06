# Eval programs
eval "$(starship init zsh)"
autoload -Uz compinit
compinit

## Zsh Command Line Editing

# Vi mode settings
bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


## Zsh Aliases
# Oldie but a goodie
if [[ $(uname) -eq "Darwin" ]]
then
    alias ls='ls -G'
else
    alias ls='ls --color=always'
fi

alias ll='ls -la'
alias lR='ls -lR'

# Git
alias gs='git status'
alias gss='git status -s'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias ga='git add'
alias gA='git add -A'
alias gl='git log'
alias gb='git branch'
alias gch='git checkout'
alias gph='git push'
alias gpl='git pull'
alias gdiff='git difftool'



## Zsh Options
# Adding Bash comforts...
setopt INTERACTIVE_COMMENTS
setopt BRACE_EXPAND
setopt DOT_GLOB

# Attempt to correct mispellings
# setopt CORRECT
# setopt CORRECT_ALL

# History
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
export HISTTIMEFORMAT="[%F %T] "

setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_ALLOW_CLOBBER # make history 'pipable'
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE 
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY


## Zsh Completions
applications=(
    kubectl
    helm
    kubeadm
    doctl
    minikube
)

for app ("$applications[@]"); do
    if (( ${+commands[$app]} )); then
        source <($app completion zsh)
    fi
done


