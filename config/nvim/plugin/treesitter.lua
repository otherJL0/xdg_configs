local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- parser_configs.lua = {
--   install_info = {
--     url = "https://github.com/tjdevries/tree-sitter-lua",
--     files = { "src/parser.c", "src/scanner.cc" },
--     branch = "main",
--   },
-- }
parser_configs.norg = {
  install_info = {
    url = "https://github.com/vhyrro/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
}
parser_configs.qml = {
  install_info = {
    url = "https://github.com/otherJL0/tree-sitter-qml",
    files = { "src/parser.c" },
    branch = "main",
  },
}

require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true,
  },

  refactor = require("config.treesitter.refactor"),
  textobjects = require("config.treesitter.textobjects"),
  playground = require("config.treesitter.playground").playground,
  query_linter = require("config.treesitter.playground").query_linter,
})

local ts_patterns = {
  ["class"] = "Structure",
  ["function"] = "Function",
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
}
require("treesitter-context").setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = true, -- Throttles plugin updates (may improve performance)
  patterns = {
    default = vim.tbl_keys(ts_patterns),
  },
})

require("indent_blankline").setup({
  show_trailing_blankline_indent = true,
  buftype_exclude = { "nofile", "terminal", "help" },
  show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
  context_patterns = vim.tbl_keys(ts_patterns),
  context_pattern_highlight = ts_patterns,
})

require("twilight").setup({
  dimming = {
    alpha = 0.1,
    inactive = true,
  },
})
