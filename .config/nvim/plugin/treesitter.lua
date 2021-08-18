require('nvim-treesitter.configs').setup({
	-- ensure_installed = require('config.treesitter.languages')
	highlight = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = { indent = { enable = true } },

	refactor = require('config.treesitter.refactor'),
	textobjects = require('config.treesitter.textobjects'),
	playground = require('config.treesitter.playground'),
})
