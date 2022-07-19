local ftutil = require('config.utils.filetype')

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local project_type = ftutil.detect_project_type()

if project_type ~= nil then
  ftutil.setup_project[project_type.type](project_type.root_dir)
end
