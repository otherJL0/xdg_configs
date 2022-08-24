autocmd BufNewFile,BufRead * if search('^#!/usr/bin/env bash', 'nw') | set filetype=bash | endif
