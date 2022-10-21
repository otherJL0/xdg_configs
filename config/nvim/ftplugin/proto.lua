vim.lsp.start({
  name = 'bufls',
  cmd = { 'bufls', 'serve' },
  root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
})
