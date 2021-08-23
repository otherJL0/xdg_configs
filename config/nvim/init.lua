vim.opt.termguicolors = true
if not pcall(require, 'packer') then
  require('config.initialize').install_packer()
else
	require('packer_plugins')
end

-- Load astronauta keymappings
vim.cmd [[runtime plugin/astronauta.vim]]

-- Load Treesitter
require('config.treesitter')

-- Load themes
-- require('themes/breeze_dark')
-- require('themes.nightfox')
require('themes.tokyonight')

require('config.compe')

local nnoremap = vim.keymap.nnoremap

function PRINT()
  local content = vim.fn.input('PRINT ')
  local result = string.format([[vim.notify(vim.inspect(%s))]], content)
  vim.fn.luaeval(result)
end

nnoremap({'  p',  PRINT })


