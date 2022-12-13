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

  -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

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
  "folke/trouble.nvim",
  "folke/todo-comments.nvim",
  "nvim-tree/nvim-web-devicons",
  "smjonas/inc-rename.nvim",
  "jinh0/eyeliner.nvim",

  -- Search
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-live-grep-args.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-telescope/telescope-project.nvim",
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
  "L3MON4D3/LuaSnip",
  "folke/trouble.nvim",
  "folke/neodev.nvim",

  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-omni",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-path",

  "stevearc/overseer.nvim",
  "stevearc/resession.nvim",
  "akinsho/toggleterm.nvim",
  "onsails/lspkind.nvim",
  "windwp/nvim-autopairs",
  "RRethy/nvim-treesitter-endwise",

  "https://github.com/b0o/SchemaStore.nvim",
  { "~whynothugo/lsp_lines.nvim", url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
})
