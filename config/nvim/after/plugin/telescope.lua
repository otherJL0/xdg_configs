vim.keymap.set('n', ' ff', function()
  require('config.telescope').git_files()
end)
vim.keymap.set('n', ' fg', function()
  require('config.telescope').live_grep_args()
end)
vim.keymap.set('n', ' fG', function()
  require('config.telescope').grep_string()
end)
vim.keymap.set('n', ' fh', function()
  require('config.telescope').help_tags()
end)
vim.keymap.set('n', ' fj', function()
  require('config.telescope').file_browser()
end)
vim.keymap.set('n', ' fb', function()
  require('config.telescope').buffers()
end)
vim.keymap.set('n', ' fm', function()
  require('config.telescope').man_pages()
end)
vim.keymap.set('n', 'gI', function()
  require('config.telescope').lsp_implementations()
end)
vim.keymap.set('n', ' fp', function()
  require('config.telescope').project()
end)

vim.api.nvim_create_user_command('Gh', function(opts)
  local fargs = opts.fargs
  -- require("telescope.command").load_command(unpack(opts.fargs))
end, {
  nargs = '*',
  complete = function(_, line)
    local actions = {
      ['pull_request'] = { 'author', 'assignee', 'label', 'search', 'state', 'base', 'limit' },
      ['issue'] = {
        'author',
        'assignee',
        'mention',
        'label',
        'milestone',
        'search',
        'state',
        'limit',
      },
    }

    local l = vim.split(line, '%s+')
    local n = #l - 2

    if n == 0 then
      return vim.tbl_filter(function(val)
        return vim.startswith(val, l[2])
      end, vim.tbl_extend('force', actions, extensions_list))
    end

    if n == 1 then
      local is_extension = vim.tbl_filter(function(val)
        return val == l[2]
      end, extensions_list)

      if #is_extension > 0 then
        local extensions_subcommand_dict = require('telescope.command').get_extensions_subcommand()
        return vim.tbl_filter(function(val)
          return vim.startswith(val, l[3])
        end, extensions_subcommand_dict[l[2]])
      end
    end

    local options_list = vim.tbl_keys(require('telescope.config').values)
    return vim.tbl_filter(function(val)
      return vim.startswith(val, l[#l])
    end, options_list)
  end,
})

local neorg = require('neorg')
local neorg_callbacks = require('neorg.callbacks')

neorg.setup({
  load = {
    ['core.integrations.telescope'] = {}, -- Enable the telescope module
    ['core.defaults'] = {},
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
