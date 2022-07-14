vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Add nvim/lua files to path
vim.opt.path:append(vim.fn.stdpath('config') .. '/lua')
-- Add packer fles to path
vim.opt.path:append(vim.fn.stdpath('data') .. '/site/pack/packer/*/*/lua')
vim.opt.suffixesadd:append('/init.lua')

vim.opt.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]

vim.opt.includeexpr = string.gsub(vim.v.fname, '%.', '/')
vim.cmd([[set includeexpr=substitute(v:fname,'\\.','/','g')]])

local xdg_data_dir = vim.env.XDG_DATA_HOME or vim.env.HOME .. '/.local/share'
local lua_language_server_dir = xdg_data_dir .. '/lua-language-server'
local sumneko_cmd = lua_language_server_dir .. '/bin/'
local current_file = vim.api.nvim_buf_get_name(0)
local root_dir = vim.fs.dirname(
  vim.fs.find({ 'stylua.toml', 'lua', 'init.lua' }, { path = current_file, upward = true })[1]
)

local sumneko_configs = require('lua-dev').setup({
  lspconfig = {
    cmd = {
      -- sumneko_cmd .. operating_system() .. "lua-language-server",
      sumneko_cmd .. 'lua-language-server',
      lua_language_server_dir .. '/main.lua',
    },
    root_dir = root_dir,
  },
})

sumneko_configs.settings.Lua.format = {
  enable = false,
}

sumneko_configs['init_options'] = sumneko_configs.settings
vim.lsp.start(sumneko_configs)
