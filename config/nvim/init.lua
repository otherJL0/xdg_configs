require("fun")()
vim.g.mapleader = " "
if not pcall(require, "packer") then
  require("config.setup").install_packer()
end

require("impatient").enable_profile()
vim.notify = require("notify")
require("config.packer")

require("config.globals")

vim.cmd("runtime plugin/astronauta.vim")

require("themes.catppuccin")
require("config.minor_modes")

vim.g.minor_mode = ""

function P(element)
  print(vim.inspect(element))
end

function PN(element)
  vim.notify(vim.inspect(element))
end
