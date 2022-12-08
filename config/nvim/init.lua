vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.notify = require("notify")
require('import')

import("config.colorscheme")

import("config.tui")
import("config.treesitter")
