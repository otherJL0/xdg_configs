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
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

