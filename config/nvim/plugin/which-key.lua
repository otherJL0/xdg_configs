local wk = require('which-key')
vim.opt.timeoutlen = 300

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = 'Comments' },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ['<space>'] = 'SPC',
    ['<cr>'] = 'RET',
    ['<tab>'] = 'TAB',
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'shadow', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 20,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { 'TelescopePrompt' },
  },
})

local telescope = setmetatable({}, {
  ---@param theme string: default, ivy, dropdown, cursor
  ---@return table: metatable with theme set
  __index = function(_, theme)
    return setmetatable({ theme = theme }, {
      ---@param self table: Self
      ---@param function_call string: Telescope action
      ---@return function: Callback
      __index = function(self, function_call)
        return require('config.telescope')[self.theme][function_call]
      end,
    })
  end,
})

wk.register({
  ['<leader>f'] = {
    name = '+file',
    f = { telescope.ivy.find_files, 'Find File' },
    g = { telescope.ivy.live_grep_args, 'Grep Files' },
    h = { telescope.ivy.help_tags, 'Search Neovim Docs' },
    b = { telescope.ivy.buffers, 'Search Neovim Docs' },
    m = { telescope.ivy.man_pages, 'Search Man Pages' },
    p = { telescope.ivy.project, 'Search Projects' },
    j = { telescope.ivy.file_browser, 'File Browser' },
    F = { telescope.ivy.git_files, 'Search files in git repo' },
    G = { telescope.ivy.grep_string, 'Grep string under cursor' },
  },
})
