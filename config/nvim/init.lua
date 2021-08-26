if pcall(require, 'packer') == 1 then
	require('plugins')
else
	vim.notify('No packer installation found')
	-- require('config.ini
end
