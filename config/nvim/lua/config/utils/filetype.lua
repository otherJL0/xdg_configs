local M = {}

function M.detect_project_type()
  local current_file = vim.api.nvim_buf_get_name(0)
  local deno_root_dir = vim.fs.dirname(
    vim.fs.find(
      { 'init.ts', 'deno.jsonc', 'dev.ts', 'deno.json', 'import_map.json' },
      { path = current_file, upward = true, type = 'file' }
    )[1]
  )
  local node_root_dir = vim.fs.dirname(
    vim.fs.find({ 'tsconfig.json' }, { path = current_file, upward = true, type = 'file' })[1]
  )
  if deno_root_dir ~= nil and node_root_dir ~= nil then
    vim.notify('Detected project root files for both deno and node projects')
    return nil
  elseif deno_root_dir ~= nil then
    return { type = 'deno', root_dir = deno_root_dir }
  elseif node_root_dir ~= nil then
    return { type = 'node', root_dir = node_root_dir }
  end
  return nil
end

M.setup_project = {
  node = function(root_dir)
    require('config.utils.node').setup(root_dir)
  end,
  deno = function(root_dir)
    require('config.utils.deno').setup(root_dir)
  end,
}
return M
