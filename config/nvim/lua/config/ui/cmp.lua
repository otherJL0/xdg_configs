local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

require("nvim-autopairs").setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
  }),

  mapping = {

    -- ... Your other mappings ...

    -- Select Next
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
    end, { "i", "s" }),

    -- Select Previous
    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Next jumpable luasnip
    ["<A-f>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {"i", "s"}),

    --Previous jumpable luasnip
    ["<A-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Confirm
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

  },
  view = {
    -- can be "custom", "wildmenu" or "native"
    entries = "custom",
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = "buffer" },
--   },
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     { name = "cmdline" },
--   }),
-- })
--
--
local colors = require("catppuccin.palettes").get_palette() -- fetch colors from palette
require("catppuccin.lib.highlighter").syntax({
  PmenuSel = { bg = colors.surface0, fg = "NONE" },
  Pmenu = { fg = colors.text, bg = colors.base },

  CmpItemAbbrDeprecated = { fg = colors.overlay1, bg = "NONE", style = { "strikethrough" } },
  CmpItemAbbrMatch = { fg = colors.blue, bg = "NONE", style = { "bold" } },
  CmpItemAbbrMatchFuzzy = { fg = colors.blue, bg = "NONE", style = { "bold" } },
  CmpItemMenu = { fg = colors.lavender, bg = "NONE", style = { "italic" } },

  CmpItemKindField = { fg = colors.surface0, bg = colors.maroon },
  CmpItemKindProperty = { fg = colors.surface0, bg = colors.maroon },
  CmpItemKindEvent = { fg = colors.surface0, bg = colors.maroon },

  CmpItemKindText = { fg = colors.surface0, bg = colors.green },
  CmpItemKindEnum = { fg = colors.surface0, bg = colors.green },
  CmpItemKindKeyword = { fg = colors.surface0, bg = colors.green },

  CmpItemKindConstant = { fg = colors.surface0, bg = colors.yellow },
  CmpItemKindConstructor = { fg = colors.surface0, bg = colors.yellow },
  CmpItemKindReference = { fg = colors.surface0, bg = colors.yellow },

  CmpItemKindFunction = { fg = colors.surface0, bg = colors.mauve },
  CmpItemKindStruct = { fg = colors.surface0, bg = colors.mauve },
  CmpItemKindClass = { fg = colors.surface0, bg = colors.mauve },
  CmpItemKindModule = { fg = colors.surface0, bg = colors.mauve },
  CmpItemKindOperator = { fg = colors.surface0, bg = colors.mauve },

  CmpItemKindVariable = { fg = colors.surface0, bg = colors.overlay1 },
  CmpItemKindFile = { fg = colors.surface0, bg = colors.overlay1 },

  CmpItemKindUnit = { fg = colors.surface0, bg = colors.peach },
  CmpItemKindSnippet = { fg = colors.surface0, bg = colors.peach },
  CmpItemKindFolder = { fg = colors.surface0, bg = colors.peach },

  CmpItemKindMethod = { fg = colors.surface0, bg = colors.blue },
  CmpItemKindValue = { fg = colors.surface0, bg = colors.blue },
  CmpItemKindEnumMember = { fg = colors.surface0, bg = colors.blue },

  CmpItemKindInterface = { fg = colors.surface0, bg = colors.teal },
  CmpItemKindColor = { fg = colors.surface0, bg = colors.teal },
  CmpItemKindTypeParameter = { fg = colors.surface0, bg = colors.teal },
})
