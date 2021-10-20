local use = require("packer").use

local function my_plugins()
  -- Essential
  use({
    "wbthomason/packer.nvim",
    "nvim-lua/plenary.nvim",
    "lewis6991/impatient.nvim",
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "kyazdani42/nvim-web-devicons",
  })

  -- LSP Extras
  use({
    "nvim-lua/lsp-status.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "ahmedkhalf/project.nvim",
    "liuchengxu/vista.vim",
    "rmagatti/goto-preview",
    requires = "neovim/lspconfig",
  })

  -- Colorschemes
  use({
    "navarasu/onedark.nvim",
    "EdenEast/nightfox.nvim",
    "Pocco81/Catppuccino.nvim",
    "tanvirtin/monokai.nvim",
    "projekt0n/github-nvim-theme",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Treesitter Extras
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    "lukas-reineke/indent-blankline.nvim",
    "romgrk/nvim-treesitter-context",
    "folke/twilight.nvim",
    "windwp/nvim-autopairs",
    requires = "nvim-treesitter/nvim-treesitter",
    run = "TSUpdate",
  })

  -- Git plugins
  use({
    "lewis6991/gitsigns.nvim",
    "TimUntersberger/neogit",
    "sindrets/diffview.nvim",
    requres = "nvim-lua/plenary",
  })

  -- Cmp and plugins
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    requires = "hrsh7th/nvim-cmp",
  })

  -- Debug
  use({
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
    "jbyuki/one-small-step-for-vimkind",
  })

  -- Misc
  use({
    "Famiu/feline.nvim",
    "tjdevries/astronauta.nvim",
    "L3MON4D3/LuaSnip",
    "monaqa/dial.nvim",
    "mhartington/formatter.nvim",
    "mfussenegger/nvim-lint",
    "numToStr/Comment.nvim",
    "chentau/marks.nvim",
    "beauwilliams/focus.nvim",
    "vim-denops/denops.vim",
    "folke/lua-dev.nvim",
    "folke/which-key.nvim",
    "folke/trouble.nvim",

    config = function()
      require("which-key").setup({})
      require("trouble").setup({})
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- Filetype specific plugins
  use({
    "vhyrro/neorg",
    branch = "unstable",
    requires = "nvim-lua/plenary.nvim",
  })
  use({
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })
  use({
    "gennaro-tedesco/nvim-jqx",
    ft = { "json" },
  })

  use({
    "mfussenegger/nvim-jdtls",
    run = function()
      local jdtls_dir = vim.fn.stdpath("cache") .. "/jdtls"
      local latest_url = "https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz"
      local temp_destination = "/tmp/jdtls.tar.gz"
      local target_destination = string.format("%s/jdtls", vim.fn.stdpath("cache"))
      vim.fn.mkdir(target_destination)
      local curl_cmd = string.format("curl -o %s %s", temp_destination, latest_url)
      local tar_cmd = string.format("tar xf %s -C %s", temp_destination, target_destination)
      vim.fn.system(curl_cmd)
      vim.fn.system(tar_cmd)
    end,
    ft = { "java", "gradle", "maven" },
  })
end

return require("packer").startup({
  my_plugins,
  config = {
    ensure_dependencies = true,
    compile_path = vim.fn.stdpath("config") .. "/lua/config/packer/compiled.lua",
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
