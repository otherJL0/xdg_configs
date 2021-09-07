-- default, darker, cool, deep, warm, warmer
vim.g.onedark_style = "darker"

-- By default it is false
vim.g.onedark_transparent_background = false

-- By default it is true
vim.g.onedark_italic_comment = false

vim.g.onedark_disable_toggle_style = true

vim.g.onedark_diagnostics_undercurl = false

vim.g.onedark_darker_diagnostics = false
require("onedark").setup()

vim.g.lualine_theme = "onedark"
