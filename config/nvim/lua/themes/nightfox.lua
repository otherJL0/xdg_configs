-- Which color style that will be applied
vim.g.nightfox_style = "nightfox"

-- Disable setting the background color
vim.g.nightfox_transparent = false

-- Configure the colors used when opening :terminal in neovim
vim.g.nightfox_terminal_colors = true

-- Make comments italic
vim.g.nightfox_italic_comments = true

-- Make function calls and names italic
vim.g.nightfox_italic_functions = false

-- Make keywords like if, for, while etc. italic
vim.g.nightfox_italic_keywords = false

-- Make strings italic
vim.g.nightfox_italic_strings = false

-- Make variable names and identifiers italic
vim.g.nightfox_italic_variables = false

-- Set TSPunctDelimiter to either hex color code or color name
vim.g.nightfox_color_delimiter = ""

-- Override specific colors or groups
vim.g.nightfox_colors = {}

require('nightfox').set()
