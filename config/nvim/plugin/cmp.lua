local cmp = require("cmp")

vim.o.completeopt = "menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = "neorg" },
    { name = "nvim_lua", keyword_length = 5 },
    { name = "nvim_lsp", keyword_length = 3 },
    { name = "buffer", keyword_length = 5 },
    { name = "path", keyword_lenth = 3 },
    { name = "luasnip", keyword_length = 2 },
    { name = "rg", keyword_length = 5 },
  },

  formatting = {
    format = require("lspkind").cmp_format({
      with_text = false,
      maxwidth = 50,
    }),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
require("nvim-autopairs").setup({
  check_ts = true,
})

require("nvim-treesitter.configs").setup({
  autopairs = { enable = true },
})

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = true, -- automatically select the first item
})

local endwise = require("nvim-autopairs.ts-rule").endwise
require("nvim-autopairs").add_rules({
  -- 'then$' is a lua regex
  -- 'end' is a match pair
  -- 'lua' is a filetype
  -- 'if_statement' is a treesitter name. set it = nil to skip check with treesitter
  endwise("then$", "end", "lua", "if_statement"),
})
