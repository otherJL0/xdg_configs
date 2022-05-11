" set relativenumber
" set number
set mouse=a
set clipboard=unnamedplus
set virtualedit=all
set ft=fish
packadd nvim-treesitter


lua << EOF

require("nvim-treesitter.configs").setup({
ensure_installed = {},
highlight = { enable = true, additional_vim_regex_hightlights = false },
})

EOF
