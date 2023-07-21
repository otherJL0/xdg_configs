return {
  -- tree-sitter
  { "nvim-treesitter/nvim-treesitter" },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = function()
      local Job = require("plenary.job")
      local path = vim.fn.stdpath("data") .. "/lazy/telescope-fzf-native.nvim"
      local jobs = {
        setup = { "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" },
        build = { "--build", "build", "--config", "Release" },
        install = { "--install", "build", "--prefix", "build" },
      }
      for stage, args in ipairs(jobs) do
        Job:new({
          command = "cmake",
          args = args,
          cwd = path,
          on_exit = function(_, _)
            vim.notify(string.format("Completed stage %s", stage))
          end,
        }):sync()
      end
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.black.with({
            cwd = function(params)
              return vim.fs.dirname(
                vim.fs.find({ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" }, { upward = true })[1]
              )
            end,
          }),
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.taplo,
          null_ls.builtins.formatting.taplo,
          null_ls.builtins.formatting.yamlfmt,
          null_ls.builtins.hover.dictionary,
          null_ls.builtins.hover.printenv,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },

  { "numToStr/Comment.nvim" },
  { "p00f/nvim-ts-rainbow" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "nvim-treesitter/playground" },
  { "danymat/neogen" },
  { "andymass/vim-matchup" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  -- Overrides
  { "rcarriga/nvim-notify" },
  { "ja-ford/delaytrain.nvim" },
  { "folke/noice.nvim" },

  -- Visual
  { "catppuccin/nvim" },
  {
    "nvim-lualine/lualine.nvim",
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- config = true, -- or `opts = {}`
    ft = { "md", "norg" },
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { "SmiteshP/nvim-navic" },
  { "anuvyklack/windows.nvim" },
  { "kevinhwang91/nvim-hlslens" },
  { "kevinhwang91/nvim-ufo" },
  { "kevinhwang91/promise-async" },
  { "petertriho/nvim-scrollbar" },
  { "nvim-zh/colorful-winsep.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "folke/trouble.nvim" },
  { "folke/todo-comments.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "smjonas/inc-rename.nvim" },
  { "jinh0/eyeliner.nvim" },

  -- Search
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "nvim-telescope/telescope-project.nvim" },
  { "ggandor/leap.nvim" },
  { "ggandor/flit.nvim" },

  -- Notes
  {
    "nvim-neorg/neorg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              dim_code_blocks = {
                adaptive = true,
                conceal = true,
                -- If true will only dim the content of the code block (without the @code and @end lines), not the entirety of the code block itself.
                content_only = true,
                enabled = true,
              },
            },
          },
          ["core.qol.todo_items"] = {
            config = {
              create_todo_items = true,
              create_todo_parents = true,
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
        },
      })
    end,
    -- ft = {"norg"},
    build = ":Neorg sync-parsers",
  },
  { "jbyuki/nabla.nvim" },
  { "rcarriga/nvim-notify" },

  -- Editing
  { "hrsh7th/nvim-cmp" },

  -- Git
  { "neogitorg/neogit" },
  { "lewis6991/gitsigns.nvim" },

  -- Debugging
  { "mfussenegger/nvim-dap" },

  -- Formatting
  { "mhartington/formatter.nvim" },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },

  { "folke/which-key.nvim" },

  { "nvim-lua/plenary.nvim" },

  { "kkharji/sqlite.lua" },
  { "L3MON4D3/LuaSnip" },
  { "folke/trouble.nvim" },
  { "folke/neodev.nvim" },

  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-omni" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lsp-document-symbol" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  { "hrsh7th/cmp-path" },

  { "nvim-neotest/neotest-python", dependencies = "nvim-neotest/neotest", ft = "python" },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  },

  { "akinsho/toggleterm.nvim" },
  { "onsails/lspkind.nvim" },
  { "windwp/nvim-autopairs" },
  { "RRethy/nvim-treesitter-endwise" },
  { "https://github.com/b0o/SchemaStore.nvim", url = "https://github.com/b0o/SchemaStore.nvim.git" },
  { "NvChad/nvim-colorizer.lua" },
  {
    "edluffy/hologram.nvim",
    ft = { "markdown", "md" },
    config = function()
      require("hologram").setup({
        auto_display = true,
      })
    end,
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     require("copilot").setup({
  --       -- auto_refresh = true,
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  --
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
}
