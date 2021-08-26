if pcall(require, "packer") == 1 then
  require("plugins")
else
  require("config.setup").install_packer()
  vim.notify("Packer installed")
end
