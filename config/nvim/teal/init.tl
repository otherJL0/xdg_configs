if not pcall(require, 'packer') then
  require('config.setup').install_packer()
end
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in ipairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
vim.g.mapleader = ' '

require('impatient').enable_profile()
vim.notify = require('notify')
require('config.packer')

require('themes.catppuccin')

vim.g.python3_host_prog = vim.fn.stdpath('cache') .. '/.venv/bin/python3'
