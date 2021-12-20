local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
require("nvim-treesitter.install").prefer_git = true

-- parser_configs.lua = {
--   install_info = {
--     url = "https://github.com/tjdevries/tree-sitter-lua",
--     files = { "src/parser.c", "src/scanner.cc" },
--     branch = "master",
--   },
-- }

parser_configs.sqlite = {
  install_info = {
    url = "https://github.com/returntocorp/tree-sitter-sqlite",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "sql",
}

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.racket = {
  install_info = {
    url = "https://github.com/otherJL0/tree-sitter-racket",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.wren = {
  install_info = {
    url = "https://github.com/otherJL0/tree-sitter-wren",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.sexp = {
  install_info = {
    url = "https://github.com/tree-sitter-orchard/tree-sitter-sexp",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = { "scheme", "lisp" },
}

parser_configs.toml = {
  install_info = {
    url = "https://github.com/ikatyang/tree-sitter-toml",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "master",
  },
}

require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  ignore_install = {
    "beancount",
    "devicetree",
    "elixir",
    "erlang",
    "godot",
    "glimmer",
    "godot-resource",
    "heex",
    "ledger",
    "php",
    "pioasm",
    "surface",
    "supercollider",
    "swift",
    "tlaplus",
    "turtle",
    "verilog",
    "yang",
  },

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
    disable = { "python" },
  },

  refactor = require("config.treesitter.refactor"),
  textobjects = require("config.treesitter.textobjects"),
  playground = require("config.treesitter.playground").playground,
  query_linter = require("config.treesitter.playground").query_linter,

  rainbow = {
    enable = true,
    extended_mode = true,
    colors = {
      "#A4B9EF",
      "#B3E1A3",
      "#ECBFBD",
      "#C6AAE8",
      "#F0AFE1",
      "#E28C8C",
      "#F7C196",
    },
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  autotag = {
    enable = true,
    filetypes = { "html", "xml" },
  },
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
  ["type_declaration"] = "Structure",
  ["value_declaration"] = "Structure",
  ["let_in_expr"] = "Structure",
  ["call_expression"] = "Function",
}
require("treesitter-context").setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  throttle = false, -- Throttles plugin updates (may improve performance)
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
