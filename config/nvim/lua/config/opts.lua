local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorlineopt = "both"
opt.cursorline = true
opt.expandtab = true
opt.swapfile = false -- No thank you
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Except when explicitly adding uppercase
opt.signcolumn = "yes"
opt.showtabline = 2 -- Always show tabline
opt.clipboard = "unamedplus"
opt.inccommand = "nosplit"
opt.mouse = "n" -- Only allow mouse in normal mode
opt.cmdheight = 1
opt.scrolloff = 10

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)
