local diffview = require('diffview')
local cb = require('diffview.config').diffview_callback
local gitsigns = require('gitsigns')
local neogit = require('neogit')
vim.opt.diffopt:append('algorithm:histogram')
require('git-conflict').setup()

diffview.setup({
  diff_binaries = false, -- Show diffs for binaries
  enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true, -- Requires nvim-web-devicons
  icons = { -- Only applies when use_icons is true.
    folder_closed = '',
    folder_open = '',
  },
  signs = {
    fold_closed = '',
    fold_open = '',
  },
  view = {
    merge_tool = {
      layout = 'diff3_mixed',
    },
  },
  file_panel = {
    listing_style = 'tree', -- One of 'list' or 'tree'
    tree_options = { -- Only applies when listing_style is 'tree'
      flatten_dirs = true, -- Flatten dirs that only contain one single dir
      folder_statuses = 'only_folded', -- One of 'never', 'only_folded' or 'always'.
    },
    win_config = {
      position = 'left',
      width = 35,
    },
  },
  file_history_panel = {
    log_options = {
      singele_file = {
        max_count = 512, -- Limit the number of commits
        follow = true, -- Follow renames (only for single file)
        all = false, -- Include all refs under 'refs/' including HEAD
        merges = false, -- List only merge commits
        no_merges = false, -- List no merge commits
        reverse = false, -- List commits in reverse order
      },
      multi_file = {
        max_count = 256, -- Limit the number of commits
        all = false, -- Include all refs under 'refs/' including HEAD
        merges = false, -- List only merge commits
        no_merges = false, -- List no merge commits
        reverse = false, -- List commits in reverse order
      },
    },
    win_config = {
      position = 'bottom',
      height = 16,
    },
  },
  default_args = { -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ['<tab>'] = cb('select_next_entry'), -- Open the diff for the next file
      ['<s-tab>'] = cb('select_prev_entry'), -- Open the diff for the previous file
      ['gf'] = cb('goto_file'), -- Open the file in a new split in previous tabpage
      ['<C-w><C-f>'] = cb('goto_file_split'), -- Open the file in a new split
      ['<C-w>gf'] = cb('goto_file_tab'), -- Open the file in a new tabpage
      ['<leader>e'] = cb('focus_files'), -- Bring focus to the files panel
      ['<leader>b'] = cb('toggle_files'), -- Toggle the files panel.
    },
    file_panel = {
      ['j'] = cb('next_entry'), -- Bring the cursor to the next file entry
      ['<down>'] = cb('next_entry'),
      ['k'] = cb('prev_entry'), -- Bring the cursor to the previous file entry.
      ['<up>'] = cb('prev_entry'),
      ['<cr>'] = cb('select_entry'), -- Open the diff for the selected entry.
      ['o'] = cb('select_entry'),
      ['<2-LeftMouse>'] = cb('select_entry'),
      ['-'] = cb('toggle_stage_entry'), -- Stage / unstage the selected entry.
      ['S'] = cb('stage_all'), -- Stage all entries.
      ['U'] = cb('unstage_all'), -- Unstage all entries.
      ['X'] = cb('restore_entry'), -- Restore entry to the state on the left side.
      ['R'] = cb('refresh_files'), -- Update stats and entries in the file list.
      ['L'] = cb('open_commit_log'),
      ['<tab>'] = cb('select_next_entry'),
      ['<s-tab>'] = cb('select_prev_entry'),
      ['gf'] = cb('goto_file'),
      ['<C-w><C-f>'] = cb('goto_file_split'),
      ['<C-w>gf'] = cb('goto_file_tab'),
      ['i'] = cb('listing_style'), -- Toggle between 'list' and 'tree' views
      ['f'] = cb('toggle_flatten_dirs'), -- Flatten empty subdirectories in tree listing style.
      ['<leader>e'] = cb('focus_files'),
      ['<leader>b'] = cb('toggle_files'),
    },
    file_history_panel = {
      ['g!'] = cb('options'), -- Open the option panel
      ['<C-A-d>'] = cb('open_in_diffview'), -- Open the entry under the cursor in a diffview
      ['y'] = cb('copy_hash'), -- Copy the commit hash of the entry under the cursor
      ['L'] = cb('open_commit_log'),
      ['zR'] = cb('open_all_folds'),
      ['zM'] = cb('close_all_folds'),
      ['j'] = cb('next_entry'),
      ['<down>'] = cb('next_entry'),
      ['k'] = cb('prev_entry'),
      ['<up>'] = cb('prev_entry'),
      ['<cr>'] = cb('select_entry'),
      ['o'] = cb('select_entry'),
      ['<2-LeftMouse>'] = cb('select_entry'),
      ['<tab>'] = cb('select_next_entry'),
      ['<s-tab>'] = cb('select_prev_entry'),
      ['gf'] = cb('goto_file'),
      ['<C-w><C-f>'] = cb('goto_file_split'),
      ['<C-w>gf'] = cb('goto_file_tab'),
      ['<leader>e'] = cb('focus_files'),
      ['<leader>b'] = cb('toggle_files'),
    },
    option_panel = {
      ['<tab>'] = cb('select'),
      ['q'] = cb('close'),
    },
  },
})

neogit.setup({
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  autorefresh = true,
  disable_builtin_notifications = false,
  commit_popup = {
    kind = 'split',
  },
  kind = 'split',
  signs = {
    -- { CLOSED, OPENED }
    section = { '>', 'v' },
    item = { '>', 'v' },
    hunk = { '', '' },
  },
  integrations = {
    diffview = true,
  },
  sections = {
    untracked = {
      folded = true,
    },
    unstaged = {
      folded = true,
    },
    staged = {
      folded = false,
    },
    stashes = {
      folded = true,
    },
    unpulled = {
      folded = true,
    },
    unmerged = {
      folded = false,
    },
    recent = {
      folded = true,
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ['B'] = 'BranchPopup',
      -- Removes the default mapping of "s"
      -- ["s"] = "",
    },
  },
})

gitsigns.setup({
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '│',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
      show_count = false,
    },
    change = {
      hl = 'GitSignsChange',
      text = '│',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
      show_count = false,
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '│',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
      show_count = false,
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '‾',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
      show_count = true,
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
      show_count = false,
    },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk({ preview = true })
      end)
      return '<Ignore>'
    end, { expr = true })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.prev_hunk({ preview = true })
      end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer)
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer)
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
    vim.keymap.set('n', '<leader>hb', function()
      gs.blame_line({ full = true })
    end)
    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame)
    vim.keymap.set('n', '<leader>hd', gs.diffthis)
    vim.keymap.set('n', '<leader>hD', function()
      gs.diffthis('~')
    end)
    vim.keymap.set('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  trouble = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  diff_opts = {
    algorithm = 'histogram',
    internal = true,
    vertical = true,
  },
  yadm = {
    enable = false,
  },
})
