autocmd BufNewFile,BufRead *.yaml if search('[^\$]{{.\+}}', 'nw') | set filetype=gotmpl | endif
