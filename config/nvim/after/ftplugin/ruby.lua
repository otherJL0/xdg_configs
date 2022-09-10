vim.lsp.start({
  name = 'typeprof',
  cmd = { 'typeprof', '--lsp', '--stdio' },
  root_dir = vim.fs.dirname(
    vim.fs.find({ 'Gemfile', 'Rakefile', 'Vagrantfile' }, { upward = true })[1]
  ),
})

vim.lsp.start({
  name = 'stree',
  cmd = { 'stree', 'lsp' },
  root_dir = vim.fs.dirname(
    vim.fs.find({ 'Gemfile', 'Rakefile', 'Vagrantfile', '.streerc' }, { upward = true })[1]
  ),
})
