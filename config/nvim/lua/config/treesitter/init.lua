local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup({
	-- ensure_installed = require('config.treesitter.languages')
	highlight = {
		enable = true,
    additional_vim_regex_highlighting = false,
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
