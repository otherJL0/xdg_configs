vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.lsp.start({
  name = 'jsonls',
  cmd = { 'vscode-json-language-server', '--stdio' },
})
