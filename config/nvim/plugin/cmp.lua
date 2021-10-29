local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

vim.o.completeopt = "menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {

    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- ["<C-p>"] = cmp.mapping.select_prev_item(),
    -- ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<C-e>"] = cmp.mapping.confirm(),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<C-e>"] = cmp.mapping.confirm({
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
  enable_check_bracket_line = true,
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
})

require("nvim-treesitter.configs").setup({
  autopairs = { enable = true },
})

local endwise = require("nvim-autopairs.ts-rule").endwise
require("nvim-autopairs").add_rules({
  -- 'then$' is a lua regex
  -- 'end' is a match pair
  -- 'lua' is a filetype
  -- 'if_statement' is a treesitter name. set it = nil to skip check with treesitter
  endwise("then$", "end", "lua", "if_statement"),
})

require("cmp").setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
  },
})

require("cmp").setup.cmdline("/", {
  sources = cmp.config.sources({
    { name = "nvim_lsp_document_symbol" },
  }, {
    { name = "buffer" },
  }),
})
