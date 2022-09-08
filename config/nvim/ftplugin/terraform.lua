vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.lsp.set_log_level(0)
vim.lsp.start({
  name = 'terraform-ls',
  cmd = {
    'terraform-ls',
    'serve',
  },
  init_options = {
    ignoreSingleFileWarning = true,
    experimentalFeatures = {
      validateOnSave = true,
      prefillRequiredFields = true,
    },
  },
  root_dir = vim.fs.dirname(vim.fs.find({ '.terraform/', '.terraform.lock.hcl' })[1]),
})
