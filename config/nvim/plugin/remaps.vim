" Keep searches centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Better undo breakpoints
inoremap  , ,<c-g>u
inoremap  . .<c-g>u
inoremap  [ [<c-g>u
inoremap  ( (<c-g>u
inoremap  { {<c-g>u
inoremap  ! !<c-g>u
inoremap  ? ?<c-g>u

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
