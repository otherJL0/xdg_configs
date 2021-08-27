local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "rose-pine",
    section_separators = { "", "" },
    component_separators = { "", "" },
  },
  sections = {
    lualine_a = {},
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {},
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "quickfix" },
})
