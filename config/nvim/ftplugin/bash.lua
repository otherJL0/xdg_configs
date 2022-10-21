vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true

vim.lsp.start({
  name = 'bashls',
  cmd = { vim.fn.stdpath('cache') .. '/node_modules/.bin/' .. 'bash-language-server', 'start' },
})
