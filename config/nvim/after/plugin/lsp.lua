local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")

local function on_attach(client)
  vim.lsp.set_log_level(0)
  require("lsp-status").on_attach(client)
  require("lsp_signature").on_attach()
end

local function load_config(language_server)
  local language_server_config = "config.lsp." .. language_server
  return require(language_server_config)
end

local language_servers = {
  "sumneko_lua",
  "pyright",
  "gopls",
  "clangd",
  "denols",
  "clangd",
  "cmake",
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

local nnoremap = vim.keymap.nnoremap
local vnoremap = vim.keymap.vnoremap
nnoremap({ "gh", require("lspsaga.provider").lsp_finder })

nnoremap({ "ca", require("lspsaga.codeaction").code_action })
vnoremap({ "ca", require("lspsaga.codeaction").range_code_action })

nnoremap({ "K", require("lspsaga.hover").render_hover_doc })
nnoremap({ "<C-K>", require("lspsaga.signaturehelp").signature_help })

nnoremap({ "gd", require("lspsaga.provider").preview_definition })

nnoremap({ "gI", require("config.telescope").ivy_lsp_implementations })
