local use = require("packer").use

local function my_plugins()
  use({ "wbthomason/packer.nvim" })
  use({ "lewis6991/impatient.nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "tjdevries/astronauta.nvim" })
  use({ "nvim-lua/lsp-status.nvim" })
  use({ "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" })
  use({ "liuchengxu/vista.vim" })
  use({ "monaqa/dial.nvim" })
  use({ "mhartington/formatter.nvim" })
  use({ "mfussenegger/nvim-lint" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  -- Colorschemes
  use({
    "navarasu/onedark.nvim",
    "EdenEast/nightfox.nvim",
  })
  use("Iron-E/nvim-soluarized")
  use({ "projekt0n/github-nvim-theme" })
  use("tanvirtin/monokai.nvim")
  use({ "Pocco81/Catppuccino.nvim" })
  use({
    "Famiu/feline.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    requires = "nvim-treesitter/nvim-treesitter",
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
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lua",
  })
  use({ "windwp/nvim-autopairs" })
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = { "html", "xml" },
  })

  use({
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
  })

  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({})
    end,
  })

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({

        ---Add a space b/w comment and the line
        ---@type boolean
        padding = true,

        ---Lines to be ignored while comment/uncomment.
        ---Could be a regex string or a function that returns a regex string.
        ---Example: Use '^$' to ignore empty lines
        ---@type string|function
        ignore = nil,

        ---Whether to create basic (operator-pending) and extra mappings for NORMAL/VISUAL mode
        ---@type table
        mappings = {
          ---operator-pending mapping
          ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
          basic = true,
          ---extended mapping
          ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
          extra = true,
        },

        ---LHS of line and block comment toggle mapping in NORMAL/VISUAL mode
        ---@type table
        toggler = {
          ---line-comment toggle
          line = "gcc",
          ---block-comment toggle
          block = "gbc",
        },

        ---LHS of line and block comment operator-mode mapping in NORMAL/VISUAL mode
        ---@type table
        opleader = {
          ---line-comment opfunc mapping
          line = "gc",
          ---block-comment opfunc mapping
          block = "gb",
        },

        ---Pre-hook, called before commenting the line
        ---@type function|nil
        pre_hook = nil,

        ---Post-hook, called after commenting is done
        ---@type function|nil
        post_hook = nil,
      })
    end,
  })

  use({
    "vhyrro/neorg",
    branch = "unstable",
    config = function()
      require("neorg").setup({
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = "~/neorg",
              },
            },
          },
        },
      })
    end,
    requires = "nvim-lua/plenary.nvim",
  })

  use({
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
      })
    end,
    requires = "nvim-treesitter/nvim-treesitter",
  })

  -- Lsp extras
  use({
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.1,
          inactive = true,
        },
      })
    end,
  })

  use({ "vim-denops/denops.vim" })
  use({
    "gennaro-tedesco/nvim-jqx",
    ft = { "json" },
  })
  use({ "jbyuki/one-small-step-for-vimkind" })

  use({
    "beauwilliams/focus.nvim",
    config = function()
      -- vim.cmd("hi link UnfocusedWindow CursorLine")
      -- vim.cmd("hi link FocusedWindow VisualNOS")
      require("focus").setup({
        excluded_filetypes = { "toggleterm" },
        excluded_buftypes = { "help", "prompt", "nofile" },
        cursorline = true,
        signcolumn = false,
        number = false,
        relativenumber = false,
        hybridnumber = false,
        winhighlight = false,
      })
    end,
  })
  use({
    "chentau/marks.nvim",
    config = function()
      require("marks").setup({
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = true,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "⚑",
          virt_text = "hello world",
        },
        mappings = {},
      })
    end,
  })
  use({
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({})
    end,
  })

  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_trailing_blankline_indent = true,
        buftype_exclude = { "nofile", "terminal" },
        show_end_of_line = true,
        space_char_blankline = " ",
        show_current_context = true,
        context_patterns = {
          "class",
          "function",
          "method",
          "for",
          "if",
          "else",
          "try",
          "except",
          "with",
          "match",
          "table",
          "import",
          "var",
          "struct",
          "case",
          "default",
          "return",
          "const",
        },
        context_pattern_highlight = {
          ["class"] = "Structure",
          ["function"] = "Function",
          ["method"] = "Function",
          ["for"] = "Repeat",
          ["if"] = "Conditional",
          ["else"] = "Conditional",
          ["try"] = "Exception",
          ["except"] = "Exception",
          ["with"] = "Keyword",
          ["match"] = "Conditional",
          ["table"] = "Structure",
          ["import"] = "Include",
          ["var"] = "Statement",
          ["struct"] = "Structure",
          ["case"] = "Label",
          ["default"] = "Label",
          ["return"] = "Keyword",
          ["const"] = "Keyword",
        },
      })
    end,
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
