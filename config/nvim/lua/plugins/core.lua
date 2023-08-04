return {
  { "folke/lazy.nvim", version = false },
  { "LazyVim/LazyVim", version = false },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {},
      },
      inlay_hints = { enabled = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        -- cursor or topline
        mode = "cursor",
        separator = "⋅",
      })
    end,
  },
}
