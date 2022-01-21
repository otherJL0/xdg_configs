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
    "fusion",
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
    -- disable = { "python" },
  },

  refactor = require("config.treesitter.refactor"),
  textobjects = require("config.treesitter.textobjects"),
  playground = require("config.treesitter.playground").playground,
  query_linter = require("config.treesitter.playground").query_linter,

  rainbow = {
    enable = true,
    extended_mode = true,
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
