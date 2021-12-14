-- Automatically install when editing
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local use = require("packer").use
-- local use_rocks = require("packer").use_rocks

local function my_plugins()
  -- use_rocks({ "tl", "cyan", { "teal-language-server", server = "https://luarocks.org/dev" } })
  -- Essential
  use({
    "wbthomason/packer.nvim",
    "nvim-lua/plenary.nvim",
    "tami5/sqlite.lua",
    "lewis6991/impatient.nvim",
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
    "kyazdani42/nvim-web-devicons",
  })
  use({ "tjdevries/tree-sitter-lua", opt = true })

  use({
    "ggandor/lightspeed.nvim",
  })

  -- LSP Extras
  use({
    "nvim-lua/lsp-status.nvim",
    "liuchengxu/vista.vim",
    "rmagatti/goto-preview",
    "onsails/lspkind-nvim",
    requires = "neovim/lspconfig",
    opt = true,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",

    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.isort,
          require("null-ls").builtins.formatting.shfmt,
          require("null-ls").builtins.diagnostics.hadolint,
          require("null-ls").builtins.diagnostics.flake8,
          require("null-ls").builtins.completion.spell,
        },
        on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
          end
        end,
      })
    end,

    ft = { "python", "lua", "bash", "dockerfile" },
  })

  -- Telescope Extras
  use({
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-smart-history.nvim",
    "nvim-telescope/telescope-packer.nvim",
    "nvim-telescope/telescope-cheat.nvim",
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-live-grep-raw.nvim",
  })

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Colorschemes
  use({
    "navarasu/onedark.nvim",
    "EdenEast/nightfox.nvim",
    "catppuccin/nvim",
    "tanvirtin/monokai.nvim",
    "projekt0n/github-nvim-theme",
    opt = true,
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
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    requires = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-cmdline" },
  })

  -- Debug
  use({
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "jbyuki/one-small-step-for-vimkind",
  })

  use({
    "Dkendal/nvim-minor-mode",
    "gpanders/nvim-parinfer",
  })
  -- Status lines
  use({
    "tjdevries/express_line.nvim",
    "windwp/windline.nvim",
    "nvim-lualine/lualine.nvim",
    opt = true,
  })
  -- Misc
  use({
    "tjdevries/astronauta.nvim",
    "L3MON4D3/LuaSnip",
    "monaqa/dial.nvim",
    "numToStr/Comment.nvim",
    "chentau/marks.nvim",
    "beauwilliams/focus.nvim",
    "vim-denops/denops.vim",
    "folke/lua-dev.nvim",
    "folke/which-key.nvim",
    "folke/trouble.nvim",

    config = function()
      require("which-key").setup({})
    end,
    requires = "kyazdani42/nvim-web-devicons",
  })

  -- UI
  use({
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
    "MunifTanjim/nui.nvim",
  })

  -- Filetype specific plugins
  use({
    "nvim-neorg/neorg",
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
    ft = { "json" },
  })
  use({
    "theHamsta/nvim-treesitter-commonlisp",
    "vlime/vlime",
  })

  use({
    "Olical/conjure",
    config = function()
      vim.cmd([[ let g:conjure#client#scheme#stdio#command = "petite"]])
      vim.cmd([[let g:conjure#client#scheme#stdio#prompt_pattern = "> $?"]])
    end,
    ft = { "scheme", "guile", "fennel" },
    requires = { "Olical/aniseed" },
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
  use({ "b0o/SchemaStore.nvim" })
  use({
    "norcalli/nvim-colorizer.lua",
  })

  use({
    "simrat39/rust-tools.nvim",
    ft = { "rust", "cargo" },
    config = function()
      require("config.rust_tools")
    end,
  })

  use({
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("flutter-tools").setup({ require("config.lsp.flutter") }) -- use defaults
    end,
    ft = { "dart" },
  })

  use({
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("crates").setup({
        smart_insert = true, -- try to be smart about inserting versions
        avoid_prerelease = true, -- don't select a prerelease if the requirement does not have a suffix
        autoload = true, -- automatically run update when opening a Cargo.toml
        autoupdate = true, -- automatically update when editing text
        loading_indicator = true, -- show a loading indicator while fetching crate versions
        date_format = "%Y-%m-%d", -- the date format passed to os.date
        text = {
          loading = "   Loading",
          version = "   %s",
          prerelease = "   %s",
          yanked = "   %s",
          nomatch = "   No match",
          upgrade = "   %s",
          error = "   Error fetching crate",
        },
        highlight = {
          loading = "CratesNvimLoading",
          version = "CratesNvimVersion",
          prerelease = "CratesNvimPreRelease",
          yanked = "CratesNvimYanked",
          nomatch = "CratesNvimNoMatch",
          upgrade = "CratesNvimUpgrade",
          error = "CratesNvimError",
        },
        popup = {
          autofocus = false, -- focus the versions popup when opening it
          copy_register = '"', -- the register into which the version will be copied
          style = "minimal", -- same as nvim_open_win config.style
          border = "shadow", -- same as nvim_open_win config.border
          version_date = true, -- display when a version was released
          max_height = 30,
          min_width = 20,
          text = {
            title = "  %s ",
            -- versions
            version = "   %s ",
            prerelease = "  %s ",
            yanked = "  %s ",
            -- features
            feature = "   %s ",
            enabled = "  %s ",
            transitive = "  %s ",
            date = " %s ",
          },
          highlight = {
            title = "CratesNvimPopupTitle",
            -- versions
            version = "CratesNvimPopupVersion",
            prerelease = "CratesNvimPopupPreRelease",
            yanked = "CratesNvimPopupYanked",
            -- features
            feature = "CratesNvimPopupFeature",
            enabled = "CratesNvimPopupEnabled",
            transitive = "CratesNvimPopupTransitive",
          },
          keys = {
            hide = { "q", "<esc>" },
            -- versions
            select = { "<cr>" },
            select_dumb = { "s" },
            copy_version = { "yy" },
            -- features
            toggle_feature = { "<cr>" },
            goto_feature = { "gd", "K" },
            jump_forward_feature = { "<c-i>" },
            jump_back_feature = { "<c-o>" },
          },
        },
        cmp = {
          text = {
            prerelease = "  pre-release ",
            yanked = "  yanked ",
          },
        },
      })
      require("cmp").setup.buffer({ sources = { { name = "crates" } } })
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
