local nnoremap = vim.keymap.nnoremap

nnoremap({'<C-f>', require('config.telescope').find_files})
nnoremap({'<C-g>', require('config.telescope').live_grep})
nnoremap({' ff', require('config.telescope').find_files})
nnoremap({' lg', require('config.telescope').live_grep})
nnoremap({' mp', require('config.telescope').man_pages})
nnoremap({' ht', require('config.telescope').help_tags})
nnoremap({' fb', require('config.telescope').file_browser})
nnoremap({' vo', require('config.telescope').vim_options})
