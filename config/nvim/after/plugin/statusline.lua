local lualine = require("lualine")

local function pwd()
  return vim.fn.getcwd()
end

lualine.setup({
  options = {
    theme = "onedark",
    section_separators = "",
    component_separators = "",
    -- section_separators = { "", "" },
    -- component_separators = { "", "" },
  },
  tabline = {
    lualine_a = { pwd },
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
