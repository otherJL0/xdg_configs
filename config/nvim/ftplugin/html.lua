vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

vim.lsp.start({
  name = 'htmlls',
  cmd = { 'vscode-html-language-server', '--stdio' },
})
