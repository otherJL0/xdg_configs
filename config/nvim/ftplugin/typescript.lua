local ftutil = require('config.utils.filetype')

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local project_type = ftutil.detect_project_type()

if project_type ~= nil then
  ftutil.setup_project[project_type.type](project_type.root_dir)
end

-- if is_deno_project and is_node_project then
--   vim.notify('Both deno and node project root files detected!')
-- elseif is_deno_project then
--   ftutil.setup_deno_project()
-- elseif is_node_project then
--   ftutil.setup_node_project()
-- else
--   vim.notify('Neither deno nor node detected')
-- end
