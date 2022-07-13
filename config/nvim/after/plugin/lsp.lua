vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
  }
)

vim.lsp.set_log_level(0)
local border = {
  { '┌', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '┐', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '┘', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '└', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

-- Fancy borders
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = border }
)

vim.o.updatetime = 200

local language_servers = {
  'sumneko_lua',
}

require('config.lsp').launch(language_servers)
require('config.lsp').launch_teal()
require('config.lsp').launch_stree()

-- register any number of sources simultaneously
vim.keymap.set('n', ' k', function()
  vim.diagnostic.open_float(0, { focusable = false, scope = 'line', border = 'single' })
end)
