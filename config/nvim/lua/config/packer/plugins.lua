-- Automatically install when editing
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
  use({ "tjdevries/tree-sitter-lua", opt = true })
  use({ "tami5/sqlite.lua", opt = true })
  use({ "andymass/vim-matchup" })
  use({ "nanotee/luv-vimdocs" })

  use({
    "lewis6991/spellsitter.nvim",
    config = function()
      vim.opt.spell = true
      require("spellsitter").setup()
    end,
  })
  use({
    "ggandor/lightspeed.nvim",
  })

  use({
    "tpope/vim-fugitive",
  })

  -- LSP Extras
  use({
    "nvim-lua/lsp-status.nvim",
    "onsails/lspkind-nvim",
  })

  use({ "j-hui/fidget.nvim" })

  use({
    "jose-elias-alvarez/null-ls.nvim",
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
    opt = true,
  })

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Colorschemes
  use({
    "catppuccin/nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  -- Treesitter Extras
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    "lukas-reineke/indent-blankline.nvim",
    "romgrk/nvim-treesitter-context",
    "windwp/nvim-autopairs",
    requires = "nvim-treesitter/nvim-treesitter",
    run = "TSUpdate",
  })

  use({
    "SmiteshP/nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
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
    "L3MON4D3/LuaSnip",
    "dmitmel/cmp-cmdline-history",
    "f3fora/cmp-spell",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    requires = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-cmdline" },
  })
  use({ "simrat39/symbols-outline.nvim" })

  -- Debug
  use({
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "jbyuki/one-small-step-for-vimkind",
    "suketa/nvim-dap-ruby",
  })

  use({
    "mfussenegger/nvim-dap-python",
    config = function()
      local function pypath()
        local cwd = vim.fn.getcwd()
        local venv_directories = { "venv", ".venv", "env" }
        for _, venv in ipairs(venv_directories) do
          local pypath_candidate = string.format("%s/%s/bin/python", cwd, venv)
          if vim.fn.executable(pypath_candidate) and vim.fn.exepath("python") == pypath_candidate then
            return pypath_candidate
          end
        end
        return nil
      end

      if pypath() == nil then
        return
      end
      local dap_py = require("dap-python")
      dap_py.setup(pypath())
      dap_py.test_runner = "pytest"

      vim.keymap.set("n", " tm", dap_py.test_method)
      vim.keymap.set("n", " tf", dap_py.test_method)
      vim.keymap.set("n", " tc", dap_py.test_class)
    end,
    ft = { "py", "python", "python3", "pytest" },
  })

  use({
    "ldelossa/gh.nvim",
    requires = { { "ldelossa/litee.nvim" } },
  })

  -- Status lines
  use({
    "feline-nvim/feline.nvim",
  })
  -- Misc
  use({
    "monaqa/dial.nvim",
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "chentoast/marks.nvim",
    -- "vim-denops/denops.vim",
    "folke/lua-dev.nvim",
    -- "folke/which-key.nvim",
    "folke/trouble.nvim",

    requires = "kyazdani42/nvim-web-devicons",
  })

  -- UI
  use({
    "stevearc/dressing.nvim",
    "MunifTanjim/nui.nvim",
    "p00f/nvim-ts-rainbow",
  })

  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.opt.termguicolors = true
      require("notify").setup({
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { focusable = false })
        end,
      })
    end,
  })

  use({ "nvim-neorg/neorg-telescope" })
  -- Filetype specific plugins
  use({
    "nvim-neorg/neorg",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope",
      "jbyuki/nabla.nvim",
      "lewis6991/spellsitter.nvim",
    },
    after = { "nvim-treesitter", "telescope.nvim", "nvim-cmp", "neorg-telescope" }, -- Ensures that neorg loads after nvim-treesitter
  })
  use({
    "windwp/nvim-ts-autotag",
  })

  use({
    "gennaro-tedesco/nvim-jqx",
    ft = { "" },
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

  use({
    "p00f/clangd_extensions.nvim",
    config = function()
      require("config.lsp.clangd_extensions")
    end,
    ft = { "c", "cpp", "c++", "h", "hpp", "cc" },
  })

  use({ "jose-elias-alvarez/nvim-lsp-ts-utils", ft = { "typescript", "tsx", "ts" } })

  use({
    "rcarriga/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
  })
  use({ "b0o/SchemaStore.nvim" })
  use({
    "norcalli/nvim-colorizer.lua",
    opt = true,
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
        insert_closing_quote = true,
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
          autofocus = false,
          copy_register = '"',
          style = "minimal",
          border = "none",
          show_version_date = false,
          show_dependency_version = true,
          max_height = 30,
          min_width = 20,
          padding = 1,
          text = {
            title = " %s",
            pill_left = "",
            pill_right = "",
            description = "%s",
            created_label = " created        ",
            created = "%s",
            updated_label = " updated        ",
            updated = "%s",
            downloads_label = " downloads      ",
            downloads = "%s",
            homepage_label = " homepage       ",
            homepage = "%s",
            repository_label = " repository     ",
            repository = "%s",
            documentation_label = " documentation  ",
            documentation = "%s",
            crates_io_label = " crates.io      ",
            crates_io = "%s",
            categories_label = " categories     ",
            keywords_label = " keywords       ",
            version = "  %s",
            prerelease = " %s",
            yanked = " %s",
            version_date = "  %s",
            feature = "  %s",
            enabled = " %s",
            transitive = " %s",
            dependency = "  %s",
            optional = " %s",
            dependency_version = "  %s",
            loading = " ",
          },
          highlight = {
            title = "CratesNvimPopupTitle",
            pill_text = "CratesNvimPopupPillText",
            pill_border = "CratesNvimPopupPillBorder",
            description = "CratesNvimPopupDescription",
            created_label = "CratesNvimPopupLabel",
            created = "CratesNvimPopupValue",
            updated_label = "CratesNvimPopupLabel",
            updated = "CratesNvimPopupValue",
            downloads_label = "CratesNvimPopupLabel",
            downloads = "CratesNvimPopupValue",
            homepage_label = "CratesNvimPopupLabel",
            homepage = "CratesNvimPopupUrl",
            repository_label = "CratesNvimPopupLabel",
            repository = "CratesNvimPopupUrl",
            documentation_label = "CratesNvimPopupLabel",
            documentation = "CratesNvimPopupUrl",
            crates_io_label = "CratesNvimPopupLabel",
            crates_io = "CratesNvimPopupUrl",
            categories_label = "CratesNvimPopupLabel",
            keywords_label = "CratesNvimPopupLabel",
            version = "CratesNvimPopupVersion",
            prerelease = "CratesNvimPopupPreRelease",
            yanked = "CratesNvimPopupYanked",
            version_date = "CratesNvimPopupVersionDate",
            feature = "CratesNvimPopupFeature",
            enabled = "CratesNvimPopupEnabled",
            transitive = "CratesNvimPopupTransitive",
            dependency = "CratesNvimPopupDependency",
            optional = "CratesNvimPopupOptional",
            dependency_version = "CratesNvimPopupDependencyVersion",
            loading = "CratesNvimPopupLoading",
          },
          keys = {
            hide = { "q", "<esc>" },
            open_url = { "<cr>" },
            select = { "<cr>" },
            select_alt = { "s" },
            toggle_feature = { "<cr>" },
            copy_value = { "yy" },
            goto_item = { "gd", "K", "<C-LeftMouse>" },
            jump_forward = { "<c-i>" },
            jump_back = { "<c-o>", "<C-RightMouse>" },
          },
        },
      })
      require("cmp").setup.buffer({ sources = { { name = "crates" } } })
    end,
  })

  use({ "ziglang/zig.vim", ft = "zig" })
  use({
    "bennypowers/nvim-regexplainer",
    config = function()
      require("regexplainer").setup({
        -- narrative, ascii, graphical
        mode = "narrative",
        auto = true,
        filetypes = {
          "python",
          "js",
          "py",
          "bash",
          "sh",
          "ts",
          "tsx",
          "jsx",
        },
        debug = true,
        -- split, popup, pasteboard
        display = "popup",
        popup = {
          border = {
            -- padding = { 1,  },
            style = "single",
          },
        },
      })
    end,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
  })
  use({ "nvim-neorg/library-of-norgxandria", opt = true })
end

return require("packer").startup({
  my_plugins,
  config = {
    ensure_dependencies = true,
    compile_path = vim.fn.stdpath("config") .. "/lua/config/packer/compiled.lua",
    max_jobs = 16,
    git = {
      clone_timeout = 10,
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
  profile = {
    enable = true,
  },
})
