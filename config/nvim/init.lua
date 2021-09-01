if not pcall(require, "packer") then
  require("config.setup").install_packer()
end

require("packer_plugins")
vim.cmd("runtime plugin/astronauta.vim")
require("impatient")
require("config.opts")
require("themes.onedark")

require("config.treesitter")
