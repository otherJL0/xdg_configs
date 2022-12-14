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
    { name = "nvim_lsp" },
  }),

  mapping = {

    -- ... Your other mappings ...

    ["<Tab>"] = cmp.mapping(function(fallback)
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

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    -- ... Your other mappings ...
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
  PmenuSel = { bg = "#282C34", fg = "NONE" },
  Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", style = { "strikethrough" } },
  CmpItemAbbrMatch = { fg = colors.blue, bg = "NONE", style = { "bold" } },
  CmpItemAbbrMatchFuzzy = { fg = colors.blue, bg = "NONE", style = { "bold" } },
  CmpItemMenu = { fg = colors.mauve, bg = "NONE", style = { "italic" } },

  CmpItemKindField = { fg = "#EED8DA", bg = colors.maroon },
  CmpItemKindProperty = { fg = "#EED8DA", bg = colors.maroon },
  CmpItemKindEvent = { fg = "#EED8DA", bg = colors.maroon },

  CmpItemKindText = { fg = "#C3E88D", bg = colors.green },
  CmpItemKindEnum = { fg = "#C3E88D", bg = colors.green },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = colors.green },

  CmpItemKindConstant = { fg = "#FFE082", bg = colors.yellow },
  CmpItemKindConstructor = { fg = "#FFE082", bg = colors.yellow },
  CmpItemKindReference = { fg = "#FFE082", bg = colors.yellow },

  CmpItemKindFunction = { fg = colors.rosewater, bg = colors.mauve },
  CmpItemKindStruct = { fg = colors.rosewater, bg = colors.mauve },
  CmpItemKindClass = { fg = colors.rosewater, bg = colors.mauve },
  CmpItemKindModule = { fg = colors.rosewater, bg = colors.mauve },
  CmpItemKindOperator = { fg = colors.rosewater, bg = colors.mauve },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit = { fg = "#F5EBD9", bg = colors.peach },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = colors.peach },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = colors.peach },

  CmpItemKindMethod = { fg = "#DDE5F5", bg = colors.blue },
  CmpItemKindValue = { fg = "#DDE5F5", bg = colors.blue },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = colors.blue },

  CmpItemKindInterface = { fg = "#D8EEEB", bg = colors.teal },
  CmpItemKindColor = { fg = "#D8EEEB", bg = colors.teal },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = colors.teal },
})
