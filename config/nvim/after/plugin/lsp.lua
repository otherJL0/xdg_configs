local language_servers = {}
require('config.lsp').launch(language_servers)
-- require('config.lsp').launch_teal()
-- require('config.lsp').launch_stree()

-- register any number of sources simultaneously
vim.keymap.set('n', ' k', function()
  vim.diagnostic.open_float(0, { focusable = false, scope = 'line', border = 'single' })
end)
