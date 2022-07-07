local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {
  'markdown',
  'plaintext',
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

vim.lsp.start({
  name = 'gopls',
  cmd = { 'gopls', '--remote=auto' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'go.mod', 'go.sum' }, { upward = true })[1]),
  init_options = {
    codelenses = {
      gc_details = true,
      generate = true,
      regenerate_cgo = true,
      test = true,
      tidy = true,
      upgrade_dependency = true,
      vendor = true,
    },
    gofumpt = true,
    usePlaceholders = true,
    semanticTokens = true,
    staticcheck = true,
    -- hoverKind = "Structured",
    hoverKind = 'FullDocumentation',
  },
  capabilities = capabilities,
})
