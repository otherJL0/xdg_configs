if not pcall(require, "packer") then
  require("config.setup").install_packer()
end
require("impatient").enable_profile()
require("config.packer")

require("config.globals")

vim.cmd("runtime plugin/astronauta.vim")
