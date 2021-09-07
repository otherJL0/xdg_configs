local nightfox = require("nightfox")

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "nightfox", -- change the colorscheme to use nordfox
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = "ITALIC", -- change style of comments to be italic
    keywords = "bold", -- change style of keywords to be bold
    functions = "italic,bold", -- styles can be a comma separated list
    strings = "bold",
    variable = "bold",
  },
  inverse = {
    match_paren = true, -- inverse the highlighting of match_parens
    visual = false,
    search = true,
  },
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

vim.g.lualine_theme = "nightfox"
