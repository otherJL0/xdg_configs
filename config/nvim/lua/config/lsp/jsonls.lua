local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  cmd = { vim.fn.stdpath('cache') .. '/node_modules/.bin/vscode-json-language-server', '--stdio' },
  filetypes = { 'json' },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end,
    },
  },
}
