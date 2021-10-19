if not pcall(require, "packer") then
  require("config.setup").install_packer()
end

for _, plugin in pairs({ "impatient", "packer_plugins" }) do
  if pcall(require, plugin) then
    require(plugin)
  end
end

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
