local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local nnoremap = vim.keymap.nnoremap

local function on_attach(client)
  vim.lsp.set_log_level(0)
  require("lsp-status").on_attach(client)

  nnoremap({ "<C-K>", vim.lsp.buf.signature_help })
  nnoremap({ "K", vim.lsp.buf.hover })
  nnoremap({ " ca", vim.lsp.buf.code_action })
  nnoremap({ "gr", vim.lsp.buf.references })
  nnoremap({ "gD", vim.lsp.buf.declaration })
  nnoremap({ "gd", vim.lsp.buf.definition })
  nnoremap({ "[d", vim.lsp.diagnostic.goto_prev })
  nnoremap({ "]d", vim.lsp.diagnostic.goto_next })
  nnoremap({ " D", vim.lsp.diagnostic.set_loclist })
  nnoremap({ "gi", vim.lsp.buf.implementation })
  nnoremap({ " K", vim.lsp.buf.type_definition })
  nnoremap({ " e", vim.lsp.diagnostic.show_line_diagnostics })
  nnoremap({ " R", vim.lsp.buf.rename })
end

local function load_config(language_server)
  local language_server_config = "config.lsp." .. language_server
  return require(language_server_config)
end

local language_servers = {
  "sumneko_lua",
}

lsp_status.register_progress()
for _, language_server in ipairs(language_servers) do
  local configs = load_config(language_server)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
  capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)
  lspconfig[language_server].setup(vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = vim.tbl_extend("keep", configs.capabilities or {}, capabilities),
  }, configs))
end
