
# Golang
set -gx GOBIN $HOME/.go/bin
set -gx GOCACHE $XDG_CACHE_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/gomod
fish_add_path --prepend --path --global $GOBIN
# set -gx fish_user_paths $GOBIN
