local root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1])

if root_dir ~= nil then
  vim.lsp.start({
    name = 'cuelsp',
    cmd = { 'cuelsp' },
    root_dir = root_dir,
  })
end

local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.cue_fmt,
    null_ls.builtins.diagnostics.cue_fmt,
  },
})
