local mocha = require("catppuccin.palettes").get_palette("mocha")

require("lualine").setup({
  options = {
    theme = "catppuccin",
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.status.message.get_hl,
        cond = require("noice").api.status.message.has,
      },
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = mocha.peach },
      },
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
        color = { fg = mocha.peach },
      },
      {
        require("noice").api.status.search.get,
        cond = require("noice").api.status.search.has,
        color = { fg = mocha.peach },
      },
    },
  },
})
