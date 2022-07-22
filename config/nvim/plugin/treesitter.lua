require('config.treesitter')

local ts_patterns = {
  ['class'] = 'Structure',
  ['function'] = 'Function',
  ['closure_expression'] = 'Function',
  ['method'] = 'Function',
  ['for'] = 'Repeat',
  ['while'] = 'Repeat',
  ['if'] = 'Conditional',
  ['else'] = 'Conditional',
  ['try'] = 'Exception',
  ['except'] = 'Exception',
  ['with'] = 'Keyword',
  ['match'] = 'Conditional',
  ['table'] = 'Structure',
  ['import'] = 'Include',
  ['var'] = 'Statement',
  ['struct'] = 'Structure',
  ['case'] = 'Label',
  ['default'] = 'Label',
  ['return'] = 'Keyword',
  ['const'] = 'Keyword',
  ['list'] = 'Structure',
  ['object'] = 'Structure',
  ['array'] = 'Structure',
  ['expression_statement'] = 'Structure',
  ['type_declaration'] = 'Structure',
  ['value_declaration'] = 'Structure',
  ['let_in_expr'] = 'Structure',
  ['call_expression'] = 'Function',
  ['tuple_expression'] = 'Structure',
}
require('treesitter-context').setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = false, -- Throttles plugin updates (may improve performance)
  patterns = {
    default = vim.tbl_keys(ts_patterns),
  },
})

require('indent_blankline').setup({
  show_trailing_blankline_indent = true,
  filetype_exclude = {
    'lspinfo',
    'packer',
    'checkhealth',
    'help',
    'man',
    '',
    'Outline',
    'tsplayground',
  },
  buftype_exclude = { 'nofile', 'terminal', 'help', 'tsplayground', 'Outline' },
  show_end_of_line = true,
  use_treesitter = true,
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = true,
  show_current_context_start_on_current_line = true,
  show_first_indent_level = true,
  use_treesiter_scope = true,
  context_patterns = vim.tbl_keys(ts_patterns),
  context_pattern_highlight = ts_patterns,
})

vim.keymap.set('n', ' tsp', require('nvim-treesitter-playground.internal').toggle)
vim.keymap.set('n', ' tsc', require('nvim-treesitter-playground.hl-info').show_hl_captures)
