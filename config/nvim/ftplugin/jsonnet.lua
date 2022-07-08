vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.lsp.start({
  name = 'jsonnet-language-server',
  cmd = { 'jsonnet-language-server', '-t' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'jsonnetfile.json' }, { upward = true })[1]),
})
