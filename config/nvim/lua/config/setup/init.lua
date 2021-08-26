local M = {}

function M.install_packer()
  local prompt = vim.fn.input("No packer installation detected. Install packer now? (y/N) ")
  vim.notify(" ") -- clears prompt screen

  if prompt ~= "y" then
    vim.cmd("quitall!")
  end

  vim.notify("Installing packer...")
  local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/"
  vim.fn.mkdir(packer_dir, "p")
  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", packer_dir .. "packer.nvim")
  )

	vim.notify("Packer installed!")
	vim.fn.input("Press return to close neovim")
	vim.cmd("quitall!")
end

return M
