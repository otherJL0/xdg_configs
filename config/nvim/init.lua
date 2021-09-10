if not pcall(require, "packer") then
  require("config.setup").install_packer()
end

for _, plugin in pairs({ "impatient", "packer_plugins" }) do
  if pcall(require, plugin) then
    require(plugin)
  end
end

vim.cmd("runtime plugin/astronauta.vim")
require("config.opts")
-- require("themes.onedark")
require("themes.nightfox")

require("config.treesitter")

-- Quickly enter command mode
vim.keymap.nnoremap({ "  ", ":" })
