require("plugins")
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0

vim.notify = require("notify")

-- require('hlslens').setup()
require("config.tui")
require("config.colorscheme")
require("config.treesitter")
require("config.lsp")
