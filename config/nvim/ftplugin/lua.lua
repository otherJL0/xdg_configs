local null_ls = require('null-ls')

require('neodev').setup({
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

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.lsp.start({
  name = 'lua-language-server',
  cmd = { 'lua-language-server' },
  before_init = require('neodev.lsp').before_init,
  root_dir = vim.fs.find({ 'stylua.toml', 'lua', 'init.lua' }, { upward = true })[1],
  settings = {
    Lua = {
      format = {
        enable = true,
      },
    },
  },
})

local formatting = null_ls.builtins.formatting
null_ls.setup({
  sources = {
    formatting.stylua,
  },
})
