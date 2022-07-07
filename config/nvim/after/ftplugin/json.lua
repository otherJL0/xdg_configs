vim.lsp.start({
  name = 'jsonls',
  cmd = { vim.fn.stdpath('cache') .. '/node_modules/.bin/vscode-json-language-server', '--stdio' },
})
