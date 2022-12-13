vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3

require("plugins")
vim.notify = require("notify")
require("config.treesitter")
require("config.colorscheme")

require("config.ui")
