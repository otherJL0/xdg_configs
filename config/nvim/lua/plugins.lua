local paq = require("paq")
paq({
  "savq/paq-nvim",
  -- tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      vim.cmd("TSUpdate")
    end,
  },
  "numToStr/Comment.nvim",
  "p00f/nvim-ts-rainbow",
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  "danymat/neogen",
  "andymass/vim-matchup",
  "nvim-treesitter/nvim-treesitter-context",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Overrides
  "rcarriga/nvim-notify",
  "ja-ford/delaytrain.nvim",
  "folke/noice.nvim",

  -- Visual
  { "catppuccin/nvim", as = "catppuccin" },
  "feline-nvim/feline.nvim",
  "lukas-reineke/headlines.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "SmiteshP/nvim-navic",
  "anuvyklack/windows.nvim",
  "kevinhwang91/nvim-hlslens",
  "petertriho/nvim-scrollbar",
  "nvim-zh/colorful-winsep.nvim",
  "MunifTanjim/nui.nvim",

  -- Search
  "nvim-telescope/telescope.nvim",
  "ggandor/leap.nvim",
  "ggandor/flit.nvim",

  -- Notes
  "nvim-neorg/neorg",
  { "jbyuki/nabla.nvim", opt = true },
  "rcarriga/nvim-notify",

  -- Editing
  "hrsh7th/nvim-cmp",

  -- Git
  "TimUntersberger/neogit",
  "lewis6991/gitsigns.nvim",

  -- Debugging
  "mfussenegger/nvim-dap",

  -- Formatting
  "mhartington/formatter.nvim",
  "williamboman/mason.nvim",

  "folke/which-key.nvim",
  "mrjones2014/legendary.nvim",

  -- Testing
  "nvim-neotest/neotest",
  "nvim-lua/plenary.nvim",

  "kkharji/sqlite.lua",
})
