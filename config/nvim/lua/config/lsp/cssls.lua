--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  capabilities = capabilities,
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
  single_file_support = true,
}
