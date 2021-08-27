local function my_plugins()
  use({ "wbthomason/packer.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "tjdevries/astronauta.nvim" })
  use({ "nvim-lua/lsp-status.nvim" })
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Git plugins
  use({
    "lewis6991/gitsigns.nvim",
    "TimUntersberger/neogit",
    "sindrets/diffview.nvim",
  })

  -- Lua
  use({ "folke/lua-dev.nvim" })

  -- Cmp and plugins
  use({
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
  })
end

return require("packer").startup({
  my_plugins,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
  profile = {
    enable = true,
    threshold = 1,
  },
})
