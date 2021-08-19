local on_attach = require('config.lsp').on_attach
local lspconfig = require('lspconfig')

local function load_config(language_server)
  local language_server_config = 'config.lsp.' .. language_server
  return require(language_server_config)
end

local language_servers = {
  'sorbet',
  'dockerls',
  'tsserver',
  'clangd',
  'cmake',
  'jsonls',
  'bashls',
  'gopls',
  'pyright',
}

for _, language_server in ipairs(language_servers) do
  local settings = load_config(language_server)
  settings.on_attach = on_attach
  lspconfig[language_server].setup({settings})
end
