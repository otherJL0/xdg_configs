if not pcall(require, "packer") then
  require("config.setup").install_packer()
end
require("impatient").enable_profile()
require("config.packer")

require("config.globals")

vim.cmd("runtime plugin/astronauta.vim")
require("config.opts")
require("themes.catppuccino")

require("config.treesitter")

-- Quickly enter command mode
vim.keymap.nnoremap({ "  ", ":" })
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Hacky ctrl-a ctrl-c
vim.keymap.nnoremap({ "ya%", "mzggy99999y'z" })
vim.keymap.nnoremap({ "da%", "ggd99999d" })

local language_servers = {
  "bashls",
  "clangd",
  "clangd",
  "cmake",
  "denols",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "ocamllsp",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "texlab",
  "yamlls",
}

require("config.lsp").launch(language_servers)
