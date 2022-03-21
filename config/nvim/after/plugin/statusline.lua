vim.api.nvim_exec(
  [[
hi WinSeparator  guifg=#96CDFB
]],
  false
)
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
}

-- Set global status line
vim.opt.laststatus = 3
require("config.statusline.express_line")
