if not pcall(require, "packer") then
  require("config.setup").install_packer()
end
require("config.packer")
require("impatient").enable_profile()

require("config.globals")

vim.cmd("runtime plugin/astronauta.vim")
