local xdg_data_dir = vim.env.XDG_DATA_HOME or vim.env.HOME .. '/.local/share'
local lua_language_server_dir = xdg_data_dir .. '/lua-language-server'

local lua_language_server_cmd = {}
for _, os in ipairs({'macOS', 'Linux', 'Windows'}) do
  local cmd_candidate = string.format('%s/bin/%s', lua_language_server_dir, os)
  if vim.fn.isdirectory(cmd_candidate) then
    lua_language_server_cmd = { 
      cmd_candidate .. '/lua-language-server', 
      lua_language_server_dir .. '/main.lua'
    }
    break
  end
end


local luadev = require("lua-dev").setup(
  {
  lspconfig = {
    cmd = lua_language_server_cmd
  },
})

return luadev
