autocmd BufNewFile,BufRead *.yaml if search('^apiVersion:', 'nw') && search('^kind:', 'nw') | setlocal filetype=k8s | endif
