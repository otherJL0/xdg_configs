local diffview = require("diffview")
local cb = require("diffview.config").diffview_callback
local gitsigns = require("gitsigns")
local neogit = require("neogit")

diffview.setup({
  diff_binaries = false, -- Show diffs for binaries
  use_icons = true, -- Requires nvim-web-devicons
  file_panel = {
    position = "left", -- One of 'left', 'right', 'top', 'bottom'
    width = 35, -- Only applies when position is 'left' or 'right'
    height = 10, -- Only applies when position is 'top' or 'bottom'
  },
  key_bindings = {
    disable_defaults = false, -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
      ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
    },
    file_panel = {
      ["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
      ["<down>"] = cb("next_entry"),
      ["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
      ["<up>"] = cb("prev_entry"),
      ["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
      ["o"] = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"] = cb("stage_all"), -- Stage all entries.
      ["U"] = cb("unstage_all"), -- Unstage all entries.
      ["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
      ["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
      ["<tab>"] = cb("select_next_entry"),
      ["<s-tab>"] = cb("select_prev_entry"),
      ["<leader>e"] = cb("focus_files"),
      ["<leader>b"] = cb("toggle_files"),
    },
  },
})

neogit.setup({
  disable_signs = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true,
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      -- ["s"] = "",
    },
  },
})

gitsigns.setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
    ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ["n <leader>hS"] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ["n <leader>hU"] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
  },
  watch_index = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  use_internal_diff = true, -- If vim.diff or luajit is present
  yadm = {
    enable = false,
  },
})
