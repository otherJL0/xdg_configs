local M = {}

function M.install_packer()
	 local prompt = vim.fn.input('No packer installation detected. Install packer? ')
  if prompt ~= 'y' then
    return
  end
  print('\n')

  local packer_dir = vim.fn.stdpath('data') .. '/site/pack/packer/start/'
  vim.fn.mkdir(packer_dir, 'p')
  local out = vim.fn.system(
    string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", packer_dir .. "packer.nvim")
  )
  print(out)
end

return M
