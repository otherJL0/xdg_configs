require("wlsample.airline_luffy")
require("wlfloatline").setup({})

require("wlfloatline").setup({
  interval = 300,
  ui = {
    active_char = "▁",
    active_color = "blue",
    active_hl = nil,
  },
  skip_filetypes = {
    "NvimTree",
    "lir",
  },
})
