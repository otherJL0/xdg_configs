vim.lsp.start({
  name = 'bashls',
  cmd = { vim.fn.stdpath('cache') .. '/node_modules/.bin/' .. 'bash-language-server', 'start' },
})
