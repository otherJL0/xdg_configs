vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Add nvim/lua files to path
vim.opt.path:append(vim.fn.stdpath("config") .. "/lua")
-- Add packer fles to path
vim.opt.path:append(vim.fn.stdpath("data") .. "/site/pack/packer/*/*/lua")
vim.opt.suffixesadd:append("/init.lua")

vim.opt.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]

vim.opt.includeexpr = string.gsub(vim.v.fname, "%.", "/")
vim.cmd([[set includeexpr=substitute(v:fname,'\\.','/','g')]])

vim.keymap.set("n", "  p", function()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local start_node = ts_utils.get_node_at_cursor()
  local parent = start_node
  while string.match(parent:type(), "variable_declaration") == nil do
    parent = parent:parent()
  end
  local children = ts_utils.get_named_children(parent)
  local rhs = children[2]
  if string.match(rhs:type(), "function_definition") then
    local lhs = children[1]
    local function_name = ts_utils.get_node_text(lhs, 0)[1]
    local lua_code = table.concat(ts_utils.get_node_text(parent, 0), " ")
    vim.fn.luaeval(lua_code)
    vim.fn.luaeval(string.format("vim.notify(vim.inspect(%s()))", function_name))
    -- lua_code = string.format("%s vim.notify(vim.inspect(%s()))", lua_code, function_name)
    -- vim.notify(lua_code)
    return
  end
  vim.notify(rhs:type())
  local lua_code = table.concat(ts_utils.get_node_text(rhs, 0), " ")
  vim.notify(vim.inspect(vim.fn.luaeval(lua_code)))
end)
