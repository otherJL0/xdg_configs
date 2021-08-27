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
