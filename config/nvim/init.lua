if not pcall(require, "packer") then
  require("config.setup").install_packer()
end
vim.g.mapleader = " "
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
vim.g.minor_mode = ""

require("impatient").enable_profile()
vim.notify = require("notify")
require("config.packer")

require("themes.catppuccin")

vim.g.python3_host_prog = vim.fn.stdpath("cache") .. "/.venv/bin/python3"
