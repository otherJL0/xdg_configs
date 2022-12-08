vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.notify = require("notify")
require('import')

-- require('hlslens').setup()
import("config.tui")
import("config.colorscheme")
import("config.treesitter")
