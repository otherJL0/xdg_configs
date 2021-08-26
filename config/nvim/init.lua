if not pcall(require, "packer") then
  require("config.setup").install_packer()
else
  require("plugins")
end
