local M = {}

function M.install_packer()
  vim.opt.loadplugins = false
  vim.cmd("filetype plugin off")
  local prompt = vim.fn.input("No packer installation detected. Install packer now? (y/N) ")
  vim.notify(" ") -- clears prompt screen

  if prompt ~= "y" then
    vim.cmd("quitall!")
  end

  vim.notify("Installing packer...")
  local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/"
  vim.fn.mkdir(packer_dir, "p")
  vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", packer_dir .. "packer.nvim")
  )

  vim.notify("Packer installed!")
  vim.cmd("packadd packer.nvim")
  require("config.packer.plugins")
  vim.schedule(function()
    require("packer").sync()
    vim.schedule(function()
      vim.fn.input("Press return to install plugins")
      -- vim.cmd("quitall!")
    end)
  end)
end

function M.install_ts_grammars()
  require(vim.fn.stdpath("config") .. "/plugin/treesitter")
  vim.fn.input("Press return to install plugins")
  require("nvim-treesitter.install").update()
end

return M
