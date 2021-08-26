if not pcall(require, "packer") then
  require("config.setup").install_packer()
end

require("packer_plugins")
vim.cmd("runtime plugin/astronauta.vim")
require("config.opts")
