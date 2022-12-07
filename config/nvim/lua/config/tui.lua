local codewindow = require('codewindow')

codewindow.setup()
codewindow.apply_default_keybinds()

require('noice').setup({
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = '50%',
      },
      size = {
        width = 60,
        height = 'auto',
      },
    },
    popupmenu = {
      relative = 'editor',
      position = {
        row = 8,
        col = '50%',
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = 'rounded',
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
      },
    },
  },
})

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false
-- require('windows').setup()
vim.keymap.set('n', '<C-w> ', require('bufresize').resize, { noremap = true, silent = true })
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  pattern = '*',
  callback = require('bufresize').resize,
})

