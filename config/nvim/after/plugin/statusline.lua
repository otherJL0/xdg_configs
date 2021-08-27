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
    lualine_b = { },
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = { "branch" },
    lualine_c = { "diff" },
    lualine_x = {"location"},
    lualine_y = {"filetype"},
    lualine_z = {"location"},
  },
  extensions = { "quickfix" },
})
