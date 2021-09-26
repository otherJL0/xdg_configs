local nnoremap = vim.keymap.nnoremap
local vnoremap = vim.keymap.vnoremap
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local nvim_command = vim.api.nvim_command

local function on_attach(client, bufnr)
  vim.lsp.set_log_level(0)
  require("lsp-status").on_attach(client)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  nnoremap({ "gD", vim.lsp.buf.declaration })
  nnoremap({ "gd", vim.lsp.buf.definition })
  nnoremap({ "K", vim.lsp.buf.hover })
  nnoremap({ "gi", vim.lsp.buf.implementation })
  nnoremap({ "<C-k>", vim.lsp.buf.signature_help })
  nnoremap({ " wa", vim.lsp.buf.add_workspace_folder })
  nnoremap({ " wr", vim.lsp.buf.remove_workspace_folder })
  nnoremap({ " D", vim.lsp.buf.type_definition })
  nnoremap({ " rn", vim.lsp.buf.rename })
  nnoremap({ "gr", vim.lsp.buf.references })
  nnoremap({ " ca", vim.lsp.buf.code_action })
  vnoremap({ " ca", vim.lsp.buf.range_code_action })
  nnoremap({ " e", vim.lsp.diagnostic.show_line_diagnostics })
  nnoremap({ "[d", vim.lsp.diagnostic.goto_prev })
  nnoremap({ "]d", vim.lsp.diagnostic.goto_next })
  nnoremap({ " q", vim.lsp.diagnostic.set_loclist })

  if client.resolved_capabilities.document_highlight then
    nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
    nnoremap({ " F", vim.lsp.buf.formatting })
    nvim_command([[augroup Format]])
    nvim_command([[autocmd! * <buffer>]])
    nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
    nvim_command([[augroup END]])
  end
end

local function load_config(language_server)
  local language_server_config = "config.lsp." .. language_server
  if pcall(require, language_server_config) then
    return require(language_server_config)
  end
  return {}
end

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
  "yamlls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)

lsp_status.register_progress()
for _, language_server in ipairs(language_servers) do
  local configs = load_config(language_server)
  lspconfig[language_server].setup(vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = vim.tbl_extend("keep", configs.capabilities or {}, capabilities),
  }, configs))
end

nnoremap({ "gI", require("config.telescope").lsp_implementations })

require("lspconfig").efm.setup({
  init_options = { documentFormatting = true },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command([[augroup Format]])
      vim.api.nvim_command([[autocmd! * <buffer>]])
      vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
      vim.api.nvim_command([[augroup END]])
    end
  end,
  filetypes = { "python" },
  -- filetypes = { 'lua' },
  settings = {
    -- rootMarkers = { ".git/" },
    languages = {
      -- lua = { formatters.lua.luaformat },
      python = {
        require("config.lsp.efm.python"),
      },
    },
  },
})
