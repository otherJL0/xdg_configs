vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

local function on_attach(client, bufnr)
  vim.lsp.set_log_level(0)
  require("lsp-status").on_attach(client)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
    vim.api.nvim_command([[augroup END]])
  end
end

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
capabilities = vim.tbl_extend("keep", capabilities, require("lsp-status").capabilities)

require("lspconfig").bashls.setup({
  cmd = { "bash-language-server", "start" },
  on_attach = on_attach,
  capabilities = capabilities,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
  },
  filetypes = { "sh", "bash" },
})
