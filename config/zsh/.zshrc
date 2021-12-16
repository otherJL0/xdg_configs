# Eval programs
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh)"
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
    export PATH="/usr/local/opt/llvm/bin:$PATH"
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


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


if [ -f $HOME/.asdf/asdf.sh ]; then
    source $HOME/.asdf/asdf.sh
fi


brew_asdf_path="/usr/local/opt/asdf/libexec/asdf.sh"
if [ -f $brew_asdf_path ]; then
    source $brew_asdf_path
fi

pythonpath="/usr/local/opt/python@3."
if [ -L ${pythonpath}9/bin/python3 ]; then
    export PATH="${pythonpath}9/bin:$PATH"
fi

if [ -L ${pythonpath}10/bin/python3 ]; then
    export PATH="${pythonpath}10/bin:$PATH"
fi

eval "$(opam env)"

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


luajit_activation="${HOME}/.local/share/hererocks/luajit/bin/activate"
if [ -f $luajit_activation ]; then
    source $luajit_activation
fi
