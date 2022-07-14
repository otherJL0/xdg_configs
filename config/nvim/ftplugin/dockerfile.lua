local null_ls = require('null-ls')
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
  sources = {
    diagnostics.hadolint,
  },
  default_timeout = 20000,
})
