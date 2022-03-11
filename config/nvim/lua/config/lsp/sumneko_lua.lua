local xdg_data_dir = vim.env.XDG_DATA_HOME or vim.env.HOME .. "/.local/share"
local lua_language_server_dir = xdg_data_dir .. "/lua-language-server"
local sumneko_cmd = lua_language_server_dir .. "/bin/"

local sumneko_configs = require("lua-dev").setup({
  lspconfig = {
    cmd = {
      -- sumneko_cmd .. operating_system() .. "lua-language-server",
      sumneko_cmd .. "lua-language-server",
      lua_language_server_dir .. "/main.lua",
    },
    root_dir = require("lspconfig.util").root_pattern("init.lua", "stylua.toml", ".luacheckrc"),
  },
})

local uri = vim.split(vim.uri_from_bufnr(0), "/")
if vim.tbl_contains(uri, "hammerspoon") then
  sumneko_configs.settings.Lua.workspace.library = vim.env.HOME .. "/.hammperspoon/Spoons/EmmyLua.spoon/annotations"
end

return sumneko_configs
