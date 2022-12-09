local codewindow = require('codewindow')

codewindow.setup()
codewindow.apply_default_keybinds()

require('noice').setup({
  lsp = {
    progress = {
      enabled = true,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
      --- @type NoiceFormat|string
      format = 'lsp_progress',
      --- @type NoiceFormat|string
      format_done = 'lsp_progress_done',
      throttle = 1000 / 30, -- frequency to update lsp progress message
      view = 'mini',
    },
    override = {
      -- override the default lsp markdown formatter with Noice
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      -- override the lsp markdown formatter with Noice
      ['vim.lsp.util.stylize_markdown'] = true,
      -- override cmp documentation with Noice (needs the other options to work)
      ['cmp.entry.get_documentation'] = true,
    },
    hover = {
      enabled = true,
      view = nil, -- when nil, use defaults from documentation
      ---@type NoiceViewOptions
      opts = {}, -- merged with defaults from documentation
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
        throttle = 50, -- Debounce lsp signature help request by 50ms
      },
      view = nil, -- when nil, use defaults from documentation
      ---@type NoiceViewOptions
      opts = {}, -- merged with defaults from documentation
    },
    message = {
      -- Messages shown by lsp servers
      enabled = true,
      view = 'notify',
      opts = {},
    },
    -- defaults for hover and signature help
    documentation = {
      view = 'hover',
      ---@type NoiceViewOptions
      opts = {
        lang = 'markdown',
        replace = true,
        render = 'plain',
        format = { '{message}' },
        win_options = { concealcursor = 'n', conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ['|(%S-)|'] = vim.cmd.help, -- vim help links
      ['%[.-%]%((%S-)%)'] = require('noice.util').open, -- markdown links
    },
    highlights = {
      ['|%S-|'] = '@text.reference',
      ['@%S+'] = '@parameter',
      ['^%s*(Parameters:)'] = '@text.title',
      ['^%s*(Return:)'] = '@text.title',
      ['^%s*(See also:)'] = '@text.title',
      ['{%S-}'] = '@parameter',
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
