if not pcall(require, 'packer') then
  require('config.initialize').install_packer()
	vim.cmd [['qall!]]
else
	require('packer_plugins')
end
