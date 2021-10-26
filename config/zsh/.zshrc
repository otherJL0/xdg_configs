# Eval programs
eval "$(starship init zsh)"
fpath+="${ZDOTDIR}/.zfunc"
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
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


## Zsh Aliases
if [ Darwin = `uname` ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=always'
fi

alias ll='ls -la'
alias lR='ls -lR'

# Git
alias gA='git add -A'
alias ga='git add'
alias gaA='git add'
alias gb='git branch'
alias gbD='git branch -D'
alias gc='git commit'
alias gcam='git commit -am'
alias gch='git checkout'
alias gcm='git commit -m'
alias gcma='git commit -ma'
alias gdiff='git diff'
alias gdifftool='git difftool'
alias gl='git log'
alias gph='git push'
alias gpl='git pull'
alias gr='git restore'
alias gs='git status'
alias gss='git status -s'



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


