local cmp = require("cmp")
local compare = require("cmp.config.compare")
local types = require("cmp.types")

local WIDE_HEIGHT = 40

cmp.setup({
  completion = {
    autocomplete = {
      types.cmp.TriggerEvent.TextChanged,
    },
    completeopt = "menu,menuone,noselect",
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
    get_trigger_characters = function(trigger_characters)
      return trigger_characters
    end,
  },

  snippet = {
    expand = function()
      error("snippet engine is not configured.")
    end,
  },

  preselect = types.cmp.PreselectMode.Item,

  documentation = {
    border = { "", "", "", " ", "", "", "", " " },
    winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
    maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
    maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
  },

  confirmation = {
    default_behavior = types.cmp.ConfirmBehavior.Insert,
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  --
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  sources = {
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  },
})
