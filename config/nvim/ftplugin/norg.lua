-- vim.keymap.set('n', '  k', require('nabla').popup)
vim.wo.conceallevel = 3

local neorg = require('neorg')
local neorg_callbacks = require('neorg.callbacks')

neorg.setup({
  load = {
    ['core.defaults'] = {},
    ['core.integrations.telescope'] = {}, -- Enable the telescope module
    ['core.presenter'] = {
      config = {
        zen_mode = 'zen-mode',
      },
    },
    ['core.integrations.treesitter'] = {
      config = {
        configure_parsers = true,
        install_parsers = true,
      },
    },
    ['core.norg.esupports.metagen'] = {
      config = {
        type = 'auto',
        update_date = true,
      },
    },
    ['core.norg.concealer'] = {
      config = {
        folds = false,
      },
    },
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<Leader>o',
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.journal'] = {},
    ['core.norg.esupports.indent'] = {},
    ['core.norg.qol.toc'] = {},
    ['core.norg.qol.todo_items'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          personal = '~/Dropbox/neorg',
          my_workspace = '~/neorg',
          alexandria = vim.fn.stdpath('data') .. '/site/pack/packer/opt/library-of-norgxandria',
        },
      },
    },
  },
})

neorg_callbacks.on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
  -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode('norg', {
    n = { -- Bind keys in normal mode
      { '<C-s>', 'core.integrations.telescope.find_linkable' },
    },

    i = { -- Bind in insert mode
      { '<C-s>', 'core.integrations.telescope.find_linkable' },
      { '<C-f>', 'core.integrations.telescope.find_linkable' },
      { '<C-l>', 'core.integrations.telescope.insert_link' },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)

vim.lsp.start({
  name = 'neorg-lsp',
  cmd = { 'neorg-lsp' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'index.norg' })[1]),
})
