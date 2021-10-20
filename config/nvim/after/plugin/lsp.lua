require("project_nvim").setup({})
require("goto-preview").setup({})
local language_servers = {
  "bashls",
  "clangd",
  "clangd",
  "cmake",
  "denols",
  "dockerls",
  "gopls",
  "html",
  "jsonls",
  "ocamllsp",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "texlab",
  "yamlls",
}

require("config.lsp").launch(language_servers)
