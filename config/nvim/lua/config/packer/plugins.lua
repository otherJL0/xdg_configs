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
    "liuchengxu/vista.vim",
    "rmagatti/goto-preview",
    "onsails/lspkind-nvim",
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
    "lukas-reineke/cmp-rg",
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
    "Iron-E/nvim-libmodal",
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
    "nvim-neorg/neorg",
    branch = "unstable",
    requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", "jbyuki/nabla.nvim" },
  })
  use({
    "windwp/nvim-ts-autotag",
    ft = { "html", "xml" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })
  use({
    "mfussenegger/nvim-jdtls",
    ft = { "maven", "mvn", "gradle", "java" },
  })
  use({
    "gennaro-tedesco/nvim-jqx",
    ft = {},
  })

  use({
    "Olical/conjure",
    ft = { "scm", "scheme", "clojure" },
  })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("telescope").load_extension("projects")
      require("project_nvim").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
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
