local ftutil = require('config.utils.filetype')

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local current_file = vim.api.nvim_buf_get_name(0)

local is_deno_project = ftutil.is_deno_project()
local is_node_project = ftutil.is_node_project()

if is_deno_project and is_node_project then
  vim.notify('Both deno and node project root files detected!')
elseif is_deno_project then
  ftutil.setup_deno_project()
elseif is_node_project then
  ftutil.setup_node_project()
else
  vim.notify('Neither deno nor node detected')
end
