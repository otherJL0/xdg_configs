if not pcall(require, 'packer') then
  require('config.initialize').install_packer()
	vim.cmd [['qall!]]
else
	require('packer_plugins')
end

-- Load astronauta keymappings
vim.cmd [[runtime plugin/astronauta.vim]]

-- Load Treesitter
require('config.treesitter')

-- Load themes
-- require('themes/breeze_dark')
require('themes/nightfox')
