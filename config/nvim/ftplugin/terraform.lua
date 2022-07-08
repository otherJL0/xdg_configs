vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.lsp.start({
  name = 'terraform-ls',
  cmd = { 'terraform-ls', 'serve' },
})
