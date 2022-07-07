local catppuccin = require('catppuccin')
vim.opt.termguicolors = true

-- latte, frappe, macchiato, mocha
vim.g.catppuccin_flavour = 'mocha'

-- configure it
catppuccin.setup({
  transparency = false,
  term_colors = true,
  styles = {
    comments = 'italic',
    conditionals = 'italic',
    loops = 'bold',
    functions = 'NONE',
    keywords = 'bold',
    strings = 'italic',
    variables = 'NONE',
    numbers = 'NONE',
    booleans = 'bold',
    properties = 'NONE',
    types = 'bold,italic',
    operators = 'bold',
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = 'italic',
        hints = 'italic',
        warnings = 'italic',
        information = 'italic',
      },
      underlines = {
        errors = 'underline',
        hints = 'underline',
        warnings = 'underline',
        information = 'underline',
      },
    },
    lsp_trouble = true,
    lsp_saga = false,
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
    barbar = false,
    bufferline = false,
    markdown = true,
    lightspeed = true,
    ts_rainbow = true,
    hop = false,
    notify = true,
    telekasten = false,
    symbols_outline = true,
    cmp = true,
  },
})
-- Lua
vim.cmd([[colorscheme catppuccin]])
