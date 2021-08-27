local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "rose-pine",
    section_separators = "",
    component_separators = "",
    -- section_separators = { "", "" },
    -- component_separators = { "", "" },
  },
  tabline = {
    lualine_a = {},
    lualine_b = { "filename" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = { "" },
    lualine_x = { require("lsp-status").status },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  extensions = { "quickfix" },
})
