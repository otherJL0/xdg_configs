vim.lsp.start({
  name = 'typeprof',
  cmd = { 'typeprof', '--lsp', '--stdio' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'Gemfile', 'Rakefile' }, { upward = true })[1]),
})
