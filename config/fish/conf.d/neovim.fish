# Neovim paths
set -gx NVIM_DATA $XDG_DATA_HOME/nvim
set -gx NVIM_CACHE $XDG_CACHE_HOME/nvim
set -gx PACKER_DIR $NVIM_DATA/site/pack/packer
set -gx PACKER_START $PACKER_DIR/start
set -gx PACKER_OPT $PACKER_DIR/opt

abbr -a nvim- nvim - -c '"set ft=json"'
abbr -a nvimj nvim - -c '"set ft=json"'
abbr -a nvimy nvim - -c '"set ft=yaml"'
