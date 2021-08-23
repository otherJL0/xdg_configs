local xdg_data_dir = vim.env.XDG_DATA_HOME or vim.env.HOME .. '/.local/share'
local lua_language_server_dir = xdg_data_dir .. '/lua-language-server'
local sumneko_cmd = lua_language_server_dir .. '/bin/'

if vim.fn.has('mac') then
  sumneko_cmd = sumneko_cmd .. 'macOS'
elseif vim.fn.has('unix') then
  sumneko_cmd = sumneko_cmd .. 'Linux'
end

return require("lua-dev").setup({
  lspconfig = {
    cmd = {
      sumneko_cmd .. '/lua-language-server',
      lua_language_server_dir .. '/main.lua',
      }
  },
})
