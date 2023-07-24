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
}
