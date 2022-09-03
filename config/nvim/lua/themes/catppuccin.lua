local catppuccin = require('catppuccin')
vim.opt.termguicolors = true

-- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = 'mocha'

-- configure it
catppuccin.setup({
  term_colors = true,
  transparent_background = false,
  dim_inactive = {
    enable = false,
  },
  compile = {
    enabled = true,
    path = vim.fn.stdpath('cache') .. '/catppuccin',
    suffix = '_compiled',
  },
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = { 'bold' },
    functions = {},
    keywords = { 'bold' },
    strings = { 'italic' },
    variables = {},
    numbers = {},
    booleans = { 'bold' },
    properties = {},
    types = { 'bold' },
    operators = { 'bold' },
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = false,
    neogit = true,
    vim_sneak = false,
    fern = false,
    barbar = true,
    bufferline = false,
    markdown = true,
    lightspeed = false,
    leap = true,
    ts_rainbow = true,
    hop = false,
    notify = true,
    telekasten = false,
    symbols_outline = true,
    cmp = true,
    navic = true,
  },
})
-- Lua
vim.cmd([[colorscheme catppuccin]])

require('tint').setup({
  bg = false,
  amt = -30,
  ignore = { 'WinSeparator', 'Status' },
})
