local paq = require("paq")
paq({
  "savq/paq-nvim",
  -- Programming Language
  {"nvim-treesitter/nvim-treesitter", run=function() vim.cmd "TSUpdate" end},
  "numToStr/Comment.nvim",
  "theHamsta/nvim-semantic-tokens",

  -- Overrides
  "miversen33/import.nvim",
  "rcarriga/nvim-notify",
  "ja-ford/delaytrain.nvim",
  "folke/noice.nvim",
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",
  "danymat/neogen",
  "andymass/vim-matchup",


  -- Visual
  {"catppuccin/nvim", as="catppuccin" },
  "feline-nvim/feline.nvim",
  "lukas-reineke/headlines.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "SmiteshP/nvim-navic",
  "anuvyklack/windows.nvim",
  "kevinhwang91/nvim-hlslens",
  "petertriho/nvim-scrollbar",
  "nvim-zh/colorful-winsep.nvim",
  "nvim-treesitter/nvim-treesitter-context",
  "p00f/nvim-ts-rainbow",
  "nvim-telescope/telescope.nvim",
  "ggandor/leap.nvim",
  "ggandor/flit.nvim",
  "MunifTanjim/nui.nvim",

  -- Notes
  "nvim-neorg/neorg",
  {"jbyuki/nabla.nvim", opt=true},
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
})
