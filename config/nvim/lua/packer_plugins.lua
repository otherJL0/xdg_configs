return require('packer').startup({function()
  use 'wbthomason/packer.nvim'

	-- Essentials
	use('nvim-lua/plenary.nvim')
	use('neovim/nvim-lspconfig')
	use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
	use('tjdevries/astronauta.nvim')
	use('nvim-lua/lsp-status.nvim')
	use('lewis6991/gitsigns.nvim')
	use('nvim-lua/popup.nvim')
	use( 'nvim-telescope/telescope.nvim')
	use('b3nj5m1n/kommentary')

	-- Treesitter Plugins
	use({
		'nvim-treesitter/playground',
		'nvim-treesitter/nvim-treesitter-refactor',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/nvim-tree-docs',
		requires = 'nvim-treesitter/nvim-treesitter',
	})

	-- Eyecandy
	use('kyazdani42/nvim-web-devicons')
	use('tjdevries/colorbuddy.nvim')


  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
