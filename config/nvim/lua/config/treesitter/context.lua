vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

local ts_patterns = {
  ["class"] = "Structure",
  ["function"] = "Function",
  ["closure_expression"] = "Function",
  ["method"] = "Function",
  ["for"] = "Repeat",
  ["while"] = "Repeat",
  ["if"] = "Conditional",
  ["else"] = "Conditional",
  ["try"] = "Exception",
  ["except"] = "Exception",
  ["with"] = "Keyword",
  ["match"] = "Conditional",
  ["table"] = "Structure",
  ["import"] = "Include",
  ["var"] = "Statement",
  ["struct"] = "Structure",
  ["case"] = "Label",
  ["default"] = "Label",
  ["return"] = "Keyword",
  ["const"] = "Keyword",
  ["list"] = "Structure",
  ["object"] = "Structure",
  ["array"] = "Structure",
  ["expression_statement"] = "Structure",
  ["type_declaration"] = "Structure",
  ["value_declaration"] = "Structure",
  ["let_in_expr"] = "Structure",
  ["call_expression"] = "Function",
  ["tuple_expression"] = "Structure",
  ["jsx_element"] = "Structure",
  ["member"] = "Structure",
  ["block_mapping_pair"] = "Structure",
}

require("indent_blankline").setup({
  char = "▎",
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  show_current_context_start_on_current_line = true,
  show_first_indent_level = true,
  use_treesiter_scope = true,
  context_patterns = vim.tbl_keys(ts_patterns),
  context_pattern_highlight = ts_patterns,
  colored_indent_levels = false,
})

require("treesitter-context").setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  patterns = {
    default = vim.tbl_keys(ts_patterns),
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },

  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  zindex = 20, -- The Z-index of the context window
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = "─",
})
