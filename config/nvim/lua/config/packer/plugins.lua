-- Automatically install when editing
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'plugins.lua' },
  command = 'source <afile> | PackerCompile',
})

local use = require('packer').use

local function my_plugins()
  -- Essential
  use({
    'wbthomason/packer.nvim',
    'nvim-lua/plenary.nvim',
    'lewis6991/impatient.nvim',
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp',
    'kyazdani42/nvim-web-devicons',
  })

  use({
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
    end,
  })
  use({ 'tjdevries/tree-sitter-lua', opt = true })
  use({ 'tami5/sqlite.lua', opt = true })
  use({ 'andymass/vim-matchup' })
  use({ 'nanotee/luv-vimdocs' })

  use({
    'lewis6991/spellsitter.nvim',
    config = function()
      vim.opt.spell = true
      require('spellsitter').setup()
    end,
  })
  use({
    'ggandor/leap.nvim',
  })

  use({
    'tpope/vim-fugitive',
  })

  -- LSP Extras
  use({
    'onsails/lspkind-nvim',
  })

  use({ 'j-hui/fidget.nvim' })

  use({
    'jose-elias-alvarez/null-ls.nvim',
  })

  use({
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup({
        calm_down = true,
        nearest_only = true,
        nearest_float_when = 'always',
      })
    end,
  })

  -- Telescope Extras
  use({
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-smart-history.nvim',
    'nvim-telescope/telescope-packer.nvim',
    'nvim-telescope/telescope-cheat.nvim',
    'nvim-telescope/telescope-github.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    opt = true,
  })

  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

  -- Colorschemes
  use({
    'catppuccin/nvim',
    as = 'catppuccin',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    run = 'CatppuccinCompile',
  })

  use({ 'romgrk/barbar.nvim' })

  -- Treesitter Extras
  use({
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-refactor',
    'nvim-treesitter/playground',
    'lukas-reineke/indent-blankline.nvim',
    'nvim-treesitter/nvim-treesitter-context',
    'windwp/nvim-autopairs',
    requires = 'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
  })

  use({
    'SmiteshP/nvim-navic',
    config = function()
      require('nvim-navic').setup()
    end,
  })

  -- Git plugins
  use({
    'lewis6991/gitsigns.nvim',
    'TimUntersberger/neogit',
    'sindrets/diffview.nvim',
    requres = 'nvim-lua/plenary',
  })

  -- Cmp and plugins
  use({
    'L3MON4D3/LuaSnip',
    'dmitmel/cmp-cmdline-history',
    'f3fora/cmp-spell',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-document-symbol',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'danymat/neogen',
    requires = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-cmdline' },
  })
  use({ 'simrat39/symbols-outline.nvim' })

  -- Debug
  use({
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',
    'jbyuki/one-small-step-for-vimkind',
    'suketa/nvim-dap-ruby',
  })

  use({
    'mfussenegger/nvim-dap-python',
    config = function()
      local function pypath()
        local cwd = vim.fn.getcwd()
        local venv_directories = { 'venv', '.venv', 'env' }
        for _, venv in ipairs(venv_directories) do
          local pypath_candidate = string.format('%s/%s/bin/python', cwd, venv)
          if
            vim.fn.executable(pypath_candidate) and vim.fn.exepath('python') == pypath_candidate
          then
            return pypath_candidate
          end
        end
        return nil
      end

      if pypath() == nil then
        return
      end
      local dap_py = require('dap-python')
      dap_py.setup(pypath())
      dap_py.test_runner = 'pytest'

      vim.keymap.set('n', ' tm', dap_py.test_method)
      vim.keymap.set('n', ' tf', dap_py.test_method)
      vim.keymap.set('n', ' tc', dap_py.test_class)
    end,
    ft = { 'py', 'python', 'python3', 'pytest' },
  })

  use({
    'ldelossa/litee.nvim',
    'ldelossa/litee-calltree.nvim',
    'ldelossa/litee-symboltree.nvim',
    'ldelossa/gh.nvim',
  })

  -- Status lines
  use({
    'feline-nvim/feline.nvim',
  })
  -- Misc
  use({
    'monaqa/dial.nvim',
    'numToStr/Comment.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'chentoast/marks.nvim',
    -- "vim-denops/denops.vim",
    'folke/lua-dev.nvim',
    'folke/which-key.nvim',
    'bellini666/trouble.nvim',

    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- UI
  use({
    'stevearc/dressing.nvim',
    'MunifTanjim/nui.nvim',
    'p00f/nvim-ts-rainbow',
  })

  use({
    'rcarriga/nvim-notify',
    config = function()
      vim.opt.termguicolors = true
      require('notify').setup({
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { focusable = false })
        end,
      })
    end,
  })

  use({ 'nvim-neorg/neorg-telescope' })
  -- Filetype specific plugins
  use({
    'nvim-neorg/neorg',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope',
      'jbyuki/nabla.nvim',
      'lewis6991/spellsitter.nvim',
    },
    after = { 'nvim-treesitter', 'telescope.nvim', 'nvim-cmp', 'neorg-telescope' }, -- Ensures that neorg loads after nvim-treesitter
  })
  use({
    'windwp/nvim-ts-autotag',
  })

  use({
    'gennaro-tedesco/nvim-jqx',
    ft = { '' },
  })

  use({
    'ahmedkhalf/project.nvim',
    config = function()
      require('telescope').load_extension('projects')
      require('project_nvim').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({
    'p00f/clangd_extensions.nvim',
    config = function()
      require('config.lsp.clangd_extensions')
    end,
    ft = { 'c', 'cpp', 'c++', 'h', 'hpp', 'cc' },
  })

  use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', ft = { 'typescript', 'tsx', 'ts' } })

  use({
    'nvim-neotest/neotest',
    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-go',
    'nvim-neotest/neotest-python',
    'haydenmeade/neotest-jest',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest',
    },
  })
  use({ 'b0o/SchemaStore.nvim' })
  use({
    'norcalli/nvim-colorizer.lua',
    opt = true,
  })

  -- use({
  --   "simrat39/rust-tools.nvim",
  --   ft = { "rust", "cargo" },
  --   config = function()
  --     require("config.rust_tools")
  --   end,
  -- })

  -- use({
  --   "akinsho/flutter-tools.nvim",
  --   requires = "nvim-lua/plenary.nvim",
  --   config = function()
  --     require("flutter-tools").setup({ require("config.lsp.flutter") }) -- use defaults
  --   end,
  --   ft = { "dart" },
  -- })

  use({
    'Saecki/crates.nvim',
    ft = { 'toml' },
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  use({
    'bennypowers/nvim-regexplainer',
    config = function()
      require('regexplainer').setup({
        -- narrative, ascii, graphical
        mode = 'narrative',
        auto = true,
        filetypes = {
          'python',
          'js',
          'py',
          'bash',
          'sh',
          'ts',
          'tsx',
          'jsx',
        },
        debug = true,
        -- split, popup, pasteboard
        display = 'popup',
        popup = {
          border = {
            -- padding = { 1,  },
            style = 'single',
          },
        },
      })
    end,
    requires = {
      'nvim-treesitter/nvim-treesitter',
      'MunifTanjim/nui.nvim',
    },
  })
  use({ 'nvim-neorg/library-of-norgxandria', opt = true })
  use({ 'glepnir/lspsaga.nvim' })
  use({
    'anuvyklack/hydra.nvim',
    requires = {
      'anuvyklack/keymap-layer.nvim',
    },
    config = function()
      require('config.hydra')
    end,
  })
end

return require('packer').startup({
  my_plugins,
  config = {
    ensure_dependencies = true,
    compile_path = vim.fn.stdpath('config') .. '/lua/config/packer/compiled.lua',
    max_jobs = 16,
    git = {
      clone_timeout = 10,
    },
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
  profile = {
    enable = true,
  },
})
