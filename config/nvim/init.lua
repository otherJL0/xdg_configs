vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.g.mapleader = ' '

-- Highlight current line and line number
vim.opt.cursorlineopt = 'both'
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.swapfile = false -- No swap files
vim.opt.splitbelow = true -- New splits open below
vim.opt.splitright = true --New vsplits open right
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Except when explicitly adding uppercase

vim.opt.inccommand = 'nosplit' -- Highlight search/replace queries
vim.opt.showmatch = true -- Show matching bracket character when hovering

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end
})

require("plugins")
vim.notify = require("notify")
require("config.treesitter")
require("config.colorscheme")

require("config.ui")
