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

  -- Debug
  use({
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "jbyuki/one-small-step-for-vimkind",
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

  -- Status lines
  use({
    "feline-nvim/feline.nvim",
  })
  -- Misc
  use({
    "monaqa/dial.nvim",
    "numToStr/Comment.nvim",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "chentau/marks.nvim",
    -- "vim-denops/denops.vim",
    "folke/lua-dev.nvim",
    -- "folke/which-key.nvim",
    "folke/trouble.nvim",

    requires = "kyazdani42/nvim-web-devicons",
  })

  -- UI
  use({
    "rcarriga/nvim-notify",
    "stevearc/dressing.nvim",
    "MunifTanjim/nui.nvim",
    "p00f/nvim-ts-rainbow",
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
    "rcarriga/vim-ultest",
    config = function()
      vim.cmd([[let test#strategy = "neovim"]])
      vim.cmd([[let test#python#pytest#options = "--color=yes"]])
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*",
        callback = function()
          vim.cmd([[UltestNearest]])
        end,
      })
    end,
    requires = { "vim-test/vim-test", opt = true },
    run = ":UpdateRemotePlugins",
    ft = { "py", "python", "python3", "pytest" },
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

  use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
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
