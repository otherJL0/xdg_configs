vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Add nvim/lua files to path
vim.opt.path:append(vim.fn.stdpath("config") .. "/lua")
-- Add packer fles to path
vim.opt.path:append(vim.fn.stdpath("data") .. "/site/pack/*/*/*/lua")
vim.opt.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
vim.opt.includeexpr = [[tr(v:fname, '.', '/')]]

local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

require("neodev").setup({
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  -- for your Neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  -- override = function(root_dir, options) end,
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = false,
})

vim.lsp.start({
  name = "lua-language-server",
  cmd = { "lua-language-server" },
  before_init = require("neodev.lsp").before_init,
  on_attach = require("config.lsp.on_attach").on_attach,
  root_dir = vim.fs.dirname(
    vim.fs.find(
      { ".luarc.json", "luarc.jsonc", "stylua.toml", ".stylua.toml", "selene.toml", "selene.yml", "selene.yaml" },
      { upward = true }
    )[1]
  ),
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "describe", "it", "vim", "setup", "teardown" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
      telemetry = { enable = false },
      hint = { enable = true, setType = true },
    },
  },
})

ls.add_snippets("lua", {
  s({ trig = "lsp" }, {
    t({ [[vim.lsp.start({]], "" }),
    t({ [[  name = "]] }),
    i(1),
    t({ [[",]], "" }),
    t({ [[  cmd = { "]] }),
    i(2),
    t({ [[" },]], "" }),
    t({ [[  root_dir = vim.fs.dirname(vim.fs.find({ "]] }),
    i(3),
    t({ [[" }, { upward = true })[1]),]], "" }),
    t({ [[  on_attach = require("config.lsp.on_attach").on_attach,]], "" }),
    t({ [[})]] }),
  }),
}, {})
