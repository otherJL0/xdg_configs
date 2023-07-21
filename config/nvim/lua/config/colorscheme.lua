require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  integrations = {
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
    aerial = false,
    barbar = false,
    beacon = false,
    dashboard = false,
    fern = false,
    gitsigns = true,
    harpoon = false,
    hop = false,
    leap = true,
    lightspeed = false,
    markdown = true,
    mason = true,
    mini = false,
    neotree = false,
    neogit = true,
    neotest = true,
    noice = true,
    cmp = true,
    notify = true,
    semantic_tokens = true,
    nvimtree = false,
    treesitter_context = true,
    treesitter = true,
    ts_rainbow = true,
    overseer = true,
    pounce = true,
    symbols_outline = false,
    telekasten = false,
    telescope = true,
    lsp_trouble = true,
    gitgutter = false,
    illuminate = false,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
  -- custom_highlights = function(colors)
  --   return {
  --     LspInlayHint = { fg = colors.teal, bg = colors.mantle, style = { "italic" } },
  --   }
  -- end,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
vim.cmd.colorscheme("catppuccin")
