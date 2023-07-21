local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" },
  },
  filetype = "gotmpl",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml" },
}

parser_config.jinja2 = {
  install_info = {
    url = "~/git/gh/otherJL0/tree-sitter-jinja2",
    files = { "src/parser.c" },
    branch = "main",
  },
  filetype = "jinja2",
  used_by = { "jinja2", "yaml" },
}

parser_config.mlir = {
  install_info = {
    url = "~/git/gh/llvm/llvm-project/mlir/utils/tree-sitter-mlir/",
    files = { "src/parser.c" },
    -- generate_requires_npm = false,
    requires_generate_from_grammar = true,
  },
  filetype = "mlir",
}
-- parser_config.requirement = {
--   install_info = {
--     url = "~/git/gh/otherJL0/tree-sitter-requirements",
--     files = { "src/parser.c" },
--     branch = "main",
--     generate_requires_npm = false,
--     requires_generate_from_grammar = true,
--   },
--   filetype = "requirement",
--   -- used_by = { "jinja2", "yaml" },
-- }

require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = {
    "agda",
    "astro",
    "awk",
    "bash",
    "bibtex",
    "c",
    "cmake",
    "comment",
    "commonlisp",
    "cpp",
    "css",
    "cuda",
    "d",
    "dart",
    "diff",
    "dockerfile",
    "dot",
    "ebnf",
    "elixir",
    "elm",
    "erlang",
    "fennel",
    "fish",
    "fortran",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "gleam",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "haskell",
    "hcl",
    "help",
    "hjson",
    "hocon",
    "html",
    "http",
    "java",
    "javascript",
    "jinja2",
    "jq",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "jsonnet",
    "julia",
    "kotlin",
    "lalrpop",
    "latex",
    "llvm",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "menhir",
    "mermaid",
    "meson",
    "mlir",
    "nickel",
    "ninja",
    "nix",
    "norg",
    "ocaml",
    "ocaml_interface",
    "ocamllex",
    "perl",
    "proto",
    "python",
    "ql",
    "query",
    -- "requirement",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scheme",
    "scss",
    "slint",
    "sql",
    "svelte",
    "teal",
    "todotxt",
    "toml",
    "tsx",
    "typescript",
    "vhs",
    "vim",
    "vue",
    "yaml",
    "zig",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  ---- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
  -- parser_install_dir = "/some/path/to/store/parsers",

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
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

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
    lsp_interop = {
      enable = true,
      -- border = "none",
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },

  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
  },
  endwise = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
})

require("config.treesitter.comment")
require("config.treesitter.context")
