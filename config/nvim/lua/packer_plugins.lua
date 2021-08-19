return require('packer').startup({function()
  use 'wbthomason/packer.nvim'

	-- Essentials
	use({
    'neovim/nvim-lspconfig',
    ft = {
      'go',
      'lua',
      'python',
      'json'
    }})
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
	use({'tjdevries/colorbuddy.nvim'})
  use({'EdenEast/nightfox.nvim'})

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
