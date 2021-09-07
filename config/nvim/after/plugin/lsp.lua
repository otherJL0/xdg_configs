local nnoremap = vim.keymap.nnoremap
local vnoremap = vim.keymap.vnoremap
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local nvim_command = vim.api.nvim_command

local function on_attach(client)
  vim.lsp.set_log_level(0)
  require("lsp-status").on_attach(client)
  require("lsp_signature").on_attach()

  if client.resolved_capabilities.document_highlight then
    nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end

  if client.resolved_capabilities.document_formatting then
    nnoremap({ " F", vim.lsp.buf.formatting })
    nvim_command([[augroup Format]])
    nvim_command([[autocmd! * <buffer>]])
    nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
    nvim_command([[augroup END]])
  end
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
  "jsonls",
  "cmake",
  "rust_analyzer",
  "ocamllsp",
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

nnoremap({ "gh", require("lspsaga.provider").lsp_finder })

nnoremap({ " ca", require("lspsaga.codeaction").code_action })
vnoremap({ " ca", require("lspsaga.codeaction").range_code_action })

nnoremap({ "K", require("lspsaga.hover").render_hover_doc })
nnoremap({ "<C-K>", require("lspsaga.signaturehelp").signature_help })

nnoremap({ "gd", require("lspsaga.provider").preview_definition })

nnoremap({ "gI", require("config.telescope").lsp_implementations })

local efm_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
    vim.api.nvim_command([[augroup END]])
  end
end

local formatters = {}
formatters.python = require("config.lsp.efm.python")

require("lspconfig").efm.setup({
  init_options = { documentFormatting = true },
  on_attach = efm_attach,
  filetypes = { "python" },
  -- filetypes = { 'lua' },
  settings = {
    -- rootMarkers = { ".git/" },
    languages = {
      -- lua = { formatters.lua.luaformat },
      python = {
        formatters.python.black,
        formatters.python.isort,
        formatters.python.flake8,
        formatters.python.mypy,
      },
    },
  },
})
