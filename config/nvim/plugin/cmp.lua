local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local languages = {
  "go",
  "javascript",
  "json",
  "lua",
  "python",
}
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "�,
}

for _, language in ipairs(languages) do
  luasnip.add_snippets(language, require("config.snippets." .. language))
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {

    ["<C-k>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
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
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm(),
    ["<C-e>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = cmp.config.sources({
    { name = "luasnip", group_index = 2 },
    { name = "neorg", group_index = 1 },
    { name = "nvim_lua", keyword_pattern = "vim.", group_index = 1 },
    { name = "nvim_lsp", trigger_character = ".", group_index = 2 },
    { name = "path", trigger_character = "/", group_index = 9 },
    { name = "buffer", group_index = 10 },
  }),

  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end,
  },
  window = {
    -- double, rounded, single, shadow
    completion = {
      border = "single",
    },
    documentation = {
      border = "single",
    },
  },
  view = {
    -- entries = "native",
    entries = { name = "custom", selection_order = "near_cursor" },
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

require("nvim-autopairs").add_rules(require("nvim-autopairs.rules.endwise-lua"))
require("nvim-autopairs").add_rules(require("nvim-autopairs.rules.endwise-ruby"))

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
  },
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "nvim_lsp_document_symbol" },
    { name = "buffer" },
  },
})

-- for _, cmd_type in ipairs({ ":", "/", "?", "@", "=" }) do
--   cmp.setup.cmdline(cmd_type, {
--     sources = {
--       { name = "cmdline_history" },
--     },
--   })
-- end
