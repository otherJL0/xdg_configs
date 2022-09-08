local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local languages = {
  'go',
  'javascript',
  'json',
  'lua',
  'python',
  'terraform',
}

for _, language in ipairs(languages) do
  luasnip.add_snippets(language, require('config.snippets.' .. language))
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm(),
    -- ['<C-e>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Insert,
    --   select = true,
    -- }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip', group_index = 2 },
    { name = 'neorg', group_index = 1 },
    { name = 'nvim_lua', keyword_pattern = 'vim.', group_index = 1 },
    { name = 'nvim_lsp', trigger_character = '.', group_index = 2 },
    { name = 'path', trigger_character = '/', group_index = 9 },
    { name = 'crates' },
    {
      name = 'buffer',
      group_index = 10,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            bufs[vim.api.nvim_win_get_buf(win)] = true
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  }),

  formatting = {
    format = require('lspkind').cmp_format({
      mode = 'symbol',
      maxwidth = 50,

      menu = {
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        luasnip = '[LuaSnip]',
        nvim_lua = '[Lua]',
        neorg = '[Neorg]',
        path = '[Path]',
      },
    }),
  },
  window = {
    -- double, rounded, single, shadow
    completion = {
      border = 'single',
    },
    documentation = {
      border = 'single',
    },
  },
  view = {
    entries = 'custom',
    -- entries = { name = "custom", selection_order = "near_cursor" },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
require('nvim-autopairs').setup({
  check_ts = true,
  enable_check_bracket_line = true,
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'Search',
    highlight_grey = 'Comment',
  },
})

require('nvim-treesitter.configs').setup({
  autopairs = { enable = true },
})

require('nvim-autopairs').add_rules(require('nvim-autopairs.rules.endwise-lua'))
require('nvim-autopairs').add_rules(require('nvim-autopairs.rules.endwise-ruby'))

-- cmp.setup.cmdline(":", {
--   sources = {
--     { name = "cmdline" },
--   },
-- })

for _, search_type in ipairs({ '/', '?' }) do
  cmp.setup.cmdline(search_type, {
    sources = cmp.config.sources({
      { name = 'nvim_lsp_document_symbol' },
      { name = 'buffer' },
    }),

    view = {
      entries = { name = 'wildmenu', separator = '|' },
    },
  })
end

for _, cmd_type in ipairs({ ':', '@' }) do
  cmp.setup.cmdline(cmd_type, {
    sources = {
      { name = 'cmdline_history' },
      { name = 'cmdline' },
    },
    view = {
      entries = { name = 'wildmenu', separator = '|' },
    },
  })
end

require('neogen').setup({ snippet_engine = 'luasnip' })
