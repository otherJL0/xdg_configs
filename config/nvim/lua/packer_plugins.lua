local function my_plugins()
  use({ "wbthomason/packer.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "tjdevries/astronauta.nvim" })
  use({ "nvim-lua/lsp-status.nvim" })
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
