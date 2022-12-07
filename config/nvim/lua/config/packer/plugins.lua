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
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
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
    'ggandor/flit.nvim',
  })

  use({
    'tpope/vim-fugitive',
  })

  -- LSP Extras
  use({ 'onsails/lspkind-nvim' })

  use({ 'jose-elias-alvarez/null-ls.nvim' })

  use({ 'gorbit99/codewindow.nvim' })

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

  use({ 'levouh/tint.nvim' })

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

  use({ 'SmiteshP/nvim-navic' })

  -- Git plugins
  use({
    'lewis6991/gitsigns.nvim',
    'TimUntersberger/neogit',
    'sindrets/diffview.nvim',
    'akinsho/git-conflict.nvim',
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
    requires = { 'hrsh7th/nvim-cmp', 'hrsh7th/cmp-cmdline' },
  })
  use({ 'simrat39/symbols-outline.nvim' })

  use({
    'danymat/neogen',
    config = function()
      require('config.neogen')
    end,
    ft = {
      'bash',
      'c',
      'c++',
      'cc',
      'cpp',
      'go',
      'h',
      'java',
      'javascript',
      'javascriptreact',
      'jsx',
      'kotlin',
      'lua',
      'python',
      'ruby',
      'rust',
      'sh',
      'tsx',
      'typescript',
      'typescriptreact',
      'vue',
    },
  })

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
    'leoluz/nvim-dap-go',
    ft = 'go',
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
    'folke/neodev.nvim',
    'folke/which-key.nvim',
    'folke/trouble.nvim',

    requires = 'kyazdani42/nvim-web-devicons',
  })

  -- UI
  use({
    'stevearc/dressing.nvim',
    'MunifTanjim/nui.nvim',
    'p00f/nvim-ts-rainbow',
  })

  use({
    'folke/noice.nvim',
    event = 'VimEnter',
    config = function()
      require('config.tui')
    end,
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

  -- Filetype specific plugins
  use({
    'nvim-neorg/neorg',
    'nvim-neorg/neorg-telescope',
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
    'lukas-reineke/headlines.nvim',
    after = { 'nvim-treesitter', 'catppuccin' },
    config = function()
      require('headlines').setup({})
    end,
    ft = { 'markdown', 'norg', 'md', 'neorg' },
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
    'nvim-neotest/neotest-plenary',
    'nvim-neotest/neotest-go',
    'nvim-neotest/neotest-python',
    'rouge8/neotest-rust',
    'haydenmeade/neotest-jest',
    'nvim-neotest/neotest',
    ft = { 'lua', 'python', 'go', 'typescript', 'javascript', 'rust' },
  })

  use({ 'b0o/SchemaStore.nvim' })
  use({ 'NVChad/nvim-colorizer.lua' })

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
    'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup({})
    end,
  })
  use({
    'stevearc/resession.nvim',
    config = function()
      require('resession').setup({})
    end,
  })

  use({
    'someone-stole-my-name/yaml-companion.nvim',
    config = function()
      require('telescope').load_extension('yaml_schema')
      local kubernetes_version = '1.22.9'
      local cfg = require('yaml-companion').setup({
        schemas = {
          result = {
            {
              name = string.format('Kubernetes %s', kubernetes_version),
              uri = string.format(
                'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v%s-standalone-strict/all.json',
                kubernetes_version
              ),
            },
          },
        },
      })
      require('lspconfig')['yamlls'].setup(cfg)
    end,
    ft = { 'yaml' },
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
            style = 'double',
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
  use({ 'stevearc/aerial.nvim' })
  use({ 'glepnir/lspsaga.nvim' })
  use({
    'anuvyklack/hydra.nvim',
    requires = {
      'anuvyklack/keymap-layer.nvim',
    },
  })

  use({
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- exclude = {"neorg", "norg"}
      })
    end,
  })

  use({
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({
        window = {
          options = {
            signcolumn = 'no',
            number = false,
            relativenumber = false,
            cursorline = false,
            list = false,
            cursorcolumn = false,
            foldcolumn = '0',
          },
        },
        plugins = {
          twilight = {
            enabled = false,
          },
          kitty = {
            enabled = true,
            font = '+8',
          },
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({
    'notomo/cmdbuf.nvim',
    config = function()
      vim.keymap.set('n', 'q:', function()
        require('cmdbuf').split_open(vim.o.cmdwinheight)
      end)
      vim.keymap.set('c', '<C-f>', function()
        require('cmdbuf').split_open(
          vim.o.cmdwinheight,
          { line = vim.fn.getcmdline(), column = vim.fn.getcmdpos() }
        )
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, false, true), 'n', true)
      end)

      -- Custom buffer mappings
      vim.api.nvim_create_autocmd({ 'User' }, {
        group = vim.api.nvim_create_augroup('cmdbuf_setting', {}),
        pattern = { 'CmdbufNew' },
        callback = function()
          vim.keymap.set('n', 'q', [[<Cmd>quit<CR>]], { nowait = true, buffer = true })
          vim.keymap.set('n', 'dd', [[<Cmd>lua require('cmdbuf').delete()<CR>]], { buffer = true })
        end,
      })

      -- open lua command-line window
      vim.keymap.set('n', 'ql', function()
        require('cmdbuf').split_open(vim.o.cmdwinheight, { type = 'lua/cmd' })
      end)

      -- q/, q? alternative
      vim.keymap.set('n', 'q/', function()
        require('cmdbuf').split_open(vim.o.cmdwinheight, { type = 'vim/search/forward' })
      end)
      vim.keymap.set('n', 'q?', function()
        require('cmdbuf').split_open(vim.o.cmdwinheight, { type = 'vim/search/backward' })
      end)
    end,
  })

  use({
    'anuvyklack/windows.nvim',
    'nvim-zh/colorful-winsep.nvim',
    'kwkarlwang/bufresize.nvim',
    requires = {
      'anuvyklack/middleclass',
      'anuvyklack/animation.nvim',
    },
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
