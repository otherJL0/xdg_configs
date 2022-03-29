return {
  select = {
    enable = true,
    lookahead = true,

    --
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["x"] = "@swappable",
    },

    --
    swap = {
      enable = true,
      swap_next = {
        ["<leader>n"] = "@swappable",
      },
      swap_previous = {
        ["<leader>N"] = "@swappable",
      },
    },

    --
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },

    --
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["g d"] = "@function.outer",
        ["g D"] = "@class.outer",
      },
    },
  },
}
