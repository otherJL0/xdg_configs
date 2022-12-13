local ctp_feline = require("catppuccin.groups.integrations.feline")
local navic = require('nvim-navic')
local clrs = require('catppuccin.palettes').get_palette()
local feline = require("feline")

local assets = {
  left_semicircle = '',
  right_semicircle = '',
  right_semicircle_cut = '',
  left_semicircle_cut = '',
  vertical_bar_chubby = '█',
  vertical_bar_medium = '┃',
  vertical_bar_thin = '│',
  left_arrow_thin = '',
  right_arrow_thin = '',
  left_arrow_filled = '',
  right_arrow_filled = '',
  slant_left = '',
  slant_left_thin = '',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin = '',
  slant_right_2 = '',
  slant_right_2_thin = '',
  chubby_dot = '●',
  slim_dot = '•',
  dir = '  ',
  file = '  ',
}

ctp_feline.setup({})

feline.setup({
  components = ctp_feline.get(),
})

local winbar = {
  active = {
    {},
    {},
    {},
  },
  inactive = {
    {},
    {},
    {},
  },
}


winbar.active[1][1] = {
  provider = {
    name = 'file_info',
    opts = {
      colored_icon = true,
      type = 'relative',
    },
  },
  hl = {
    fg = clrs.flamingo,
    bg = clrs.base,
  },
}

winbar.active[1][2] = {
  provider = function()
      return navic.get_location()
  end,
  enabled = function()
    return navic.is_available()
  end,
  hl = {
    bg = clrs.overlay0,
  },
  left_sep = {
    str = assets.vertical_bar_medium,
  },
}

winbar.active[1][3] = {
  hl = {
    bg = clrs.base,
  },
}

winbar.inactive[1][1] = {
  provider = {
    name = 'file_info',
    opts = {
      colored_icon = true,
      type = 'relative',
    },
  },
  hl = {
    fg = clrs.overlay0,
    bg = clrs.base,
  },
}

require('feline').winbar.setup({
  components = {
    active = winbar.active,
    inactive = winbar.inactive,
  },
})
