return require('packer').startup({function()
  use 'wbthomason/packer.nvim'

	-- Essentials
	use({'neovim/nvim-lspconfig'})
	use({'nvim-telescope/telescope.nvim'})
	use({'nvim-lua/plenary.nvim'})
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use({'tjdevries/astronauta.nvim'})
	use({'nvim-lua/lsp-status.nvim'})
	use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
})
	use({'nvim-lua/popup.nvim'})
	use({'b3nj5m1n/kommentary'})

	-- Treesitter Plugins
	use({
		'nvim-treesitter/playground',
		'nvim-treesitter/nvim-treesitter-refactor',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/nvim-tree-docs',
		requires = 'nvim-treesitter/nvim-treesitter',
	})

	-- Eyecandy
	use({'kyazdani42/nvim-web-devicons'})
  use({
    'edluffy/specs.nvim',
    config = function()
      require('specs').setup{ 
        show_jumps  = true,
        min_jump = 30,
        popup = {
            delay_ms = 0, -- delay before popup displays
            inc_ms = 10, -- time increments used for fade/resize effects 
            blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width = 10,
            winhl = "PMenu",
            fader = require('specs').linear_fader,
            resizer = require('specs').slide_resizer
        },
        ignore_filetypes = {},
        ignore_buftypes = {
            nofile = true,
        },
    }
    end
  })
	-- use({'tjdevries/colorbuddy.nvim'})
  use({'EdenEast/nightfox.nvim'})
  use({'folke/tokyonight.nvim'})

  -- Extras
  use({'folke/trouble.nvim'})
  use({'folke/which-key.nvim'})
  use({'folke/todo-comments.nvim'})
  use({'folke/zen-mode.nvim'})
  use({'folke/lua-dev.nvim'})
  use({'folke/twilight.nvim'})
  use({'kyazdani42/nvim-tree.lua'})
  use({'mhartington/formatter.nvim'})
  use({'glepnir/lspsaga.nvim'})
  use({'lukas-reineke/indent-blankline.nvim'})
  use({
    'akinsho/nvim-bufferline.lua',
    config = function()
      require('bufferline').setup({})
    end
  })
  use({'tjdevries/express_line.nvim'})



  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  },
  profile = {
    enable = true,
    threshold = 1,
  }
})
