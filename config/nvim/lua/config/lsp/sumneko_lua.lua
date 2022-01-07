local xdg_data_dir = vim.env.XDG_DATA_HOME or vim.env.HOME .. "/.local/share"
local lua_language_server_dir = xdg_data_dir .. "/lua-language-server"
local sumneko_cmd = lua_language_server_dir .. "/bin/"

local operating_system = function()
  if vim.fn.has("mac") == 1 then
    return "macOS/"
  elseif vim.fn.has("unix") == 1 then
    return ""
  end
  return ""
end

return require("lua-dev").setup({
  lspconfig = {
    cmd = {
      sumneko_cmd .. operating_system() .. "lua-language-server",
      lua_language_server_dir .. "/main.lua",
    },
    root_dir = require("lspconfig.util").root_pattern("init.lua", "stylua.toml", ".luacheckrc"),
  },
})
