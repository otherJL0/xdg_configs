local lsp = require('feline.providers.lsp')
local lsp_severity = vim.diagnostic.severity
local hydra = require('hydra.statusline')
local clrs = require('catppuccin.palettes').get_palette()
local ucolors = require('catppuccin.utils.colors')
local latte = require('catppuccin.palettes').get_palette('latte')
local navic = require('nvim-navic')
navic.setup({
  highlight = true,
})

local function get_python_version(venv)
  for _, version in ipairs({ '3.11', '3.10', '3.9', '3.8', '3.7', '3.6' }) do
    if vim.fn.getftype(string.format('%s/bin/python%s', venv, version)) ~= '' then
      return version
    end
  end
  return 'unknown'
end

local function diffview_enabled()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if string.match(filename, 'diffview') ~= nil then
        return true
      end
    end
  end
  return false
end

local function diffview_buffer()
  local filename = vim.api.nvim_buf_get_name(0)
  if string.match(filename, ':2:') then
    return 'HEAD'
  end

  if string.match(filename, ':3:') then
    return 'BRANCH'
  end

  if string.match(filename, 'FilePanel') then
    return ''
  end

  return 'STAGING'
end

local function get_diffview_color()
  local hl = {
    fg = clrs.crust,
    bg = clrs.overlay0,
  }
  local filename = vim.api.nvim_buf_get_name(0)
  local diffview_buffer = diffview_buffer(filename)
  if diffview_buffer == 'STAGING' then
    hl.bg = clrs.peach
  end
  if diffview_buffer == 'HEAD' then
    hl.bg = clrs.red
  end
  if diffview_buffer == 'BRANCH' then
    hl.bg = clrs.yellow
  end
  return hl
end

vim.opt.fillchars = {
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
}

vim.opt.laststatus = 3

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

-- settings
local sett = {
  text = ucolors.vary_color({ latte = latte.base }, clrs.surface0),
  bkg = ucolors.vary_color({ latte = latte.crust }, clrs.surface0),
  diffs = clrs.mauve,
  extras = clrs.overlay1,
  curr_file = clrs.maroon,
  curr_dir = clrs.flamingo,
  show_modified = false,
}

local mode_colors = {
  ['n'] = { 'NORMAL', clrs.lavender },
  ['no'] = { 'N-PENDING', clrs.lavender },
  ['i'] = { 'INSERT', clrs.green },
  ['ic'] = { 'INSERT', clrs.green },
  ['t'] = { 'TERMINAL', clrs.green },
  ['v'] = { 'VISUAL', clrs.flamingo },
  ['V'] = { 'V-LINE', clrs.flamingo },
  [''] = { 'V-BLOCK', clrs.flamingo },
  ['R'] = { 'REPLACE', clrs.maroon },
  ['Rv'] = { 'V-REPLACE', clrs.maroon },
  ['s'] = { 'SELECT', clrs.maroon },
  ['S'] = { 'S-LINE', clrs.maroon },
  [''] = { 'S-BLOCK', clrs.maroon },
  ['c'] = { 'COMMAND', clrs.peach },
  ['cv'] = { 'COMMAND', clrs.peach },
  ['ce'] = { 'COMMAND', clrs.peach },
  ['r'] = { 'PROMPT', clrs.teal },
  ['rm'] = { 'MORE', clrs.teal },
  ['r?'] = { 'CONFIRM', clrs.mauve },
  ['!'] = { 'SHELL', clrs.green },
}

local shortline = false

local function is_enabled(is_shortline, winid, min_width)
  if is_shortline then
    return true
  end

  winid = winid or 0
  return vim.api.nvim_win_get_width(winid) > min_width
end

-- Initialize the components table
local components = {
  {}, -- left
  {},
  {}, -- right
}

-- global components
local invi_sep = {
  str = ' ',
  hl = {
    fg = sett.bkg,
    bg = sett.bkg,
  },
}

-- helpers

-- Current vi mode ------>
local vi_mode_hl = function()
  local colors = {
    fg = sett.bkg,
    bg = mode_colors[vim.fn.mode()][2],
    style = 'bold',
  }
  if hydra.is_active() then
    colors.bg = hydra.get_color() or ''
  end
  return colors
end

local vi_mode_hl_inv = function()
  local colors = {
    bg = sett.bkg,
    fg = mode_colors[vim.fn.mode()][2],
    style = 'bold',
  }
  if hydra.is_active() then
    colors.bg = hydra.get_color() or ''
  end
  return colors
end

components[1][1] = {
  provider = function()
    if hydra.is_active() then
      return hydra.get_name() or ' '
    end
    return ' ' .. mode_colors[vim.fn.mode()][1] .. ' '
    -- return ' '
  end,
  hl = vi_mode_hl,
}

components[1][2] = {
  provider = 'git_branch',
  enabled = is_enabled(shortline, nil, 70),
  -- hl = vi_mode_hl,
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  icon = '  ',
  -- left_sep = {
  --   str = assets.vertical_bar_chubby,
  -- },
  right_sep = {
    str = assets.vertical_bar_chubby,
  },
}

-- Diffs ------>
components[1][3] = {
  provider = 'git_diff_added',
  hl = {
    fg = clrs.green,
    bg = sett.bkg,
  },
  icon = '  ',
}

components[1][4] = {
  provider = 'git_diff_changed',
  hl = {
    fg = clrs.yellow,
    bg = sett.bkg,
  },
  icon = '  ',
}

components[1][5] = {
  provider = 'git_diff_removed',
  hl = {
    fg = clrs.red,
    bg = sett.bkg,
  },
  icon = '  ',
}

components[2][1] = {
  hl = {
    bg = sett.bkg,
  },
}
components[2][2] = {
  provider = function()
    local venv = vim.split(vim.env.VIRTUAL_ENV, '/', { trimempty = true })
    return string.format('%s(%s)', venv[#venv], get_python_version(vim.env.VIRTUAL_ENV))
  end,

  enabled = function()
    return vim.env.VIRTUAL_ENV ~= nil
  end,

  hl = {
    bg = sett.curr_dir,
    fg = sett.bkg,
  },

  left_sep = {
    str = assets.left_semicircle,
    hl = {
      fg = sett.curr_dir,
      bg = sett.bkg,
    },
  },

  right_sep = {
    str = assets.right_semicircle,
    hl = {
      fg = sett.curr_dir,
      bg = sett.bkg,
    },
  },
}

components[2][3] = {
  provider = function()
    local schema = require('yaml-companion').get_buf_schema(0)
    if schema then
      return schema.result[1].name
    end
    return ''
  end,
  enabled = function()
    if vim.bo.filetype == 'yaml' then
      local schema = require('yaml-companion').get_buf_schema(0)
      if schema then
        return true
      end
    end
    return false
  end,
  hl = {
    bg = sett.curr_dir,
    fg = sett.bkg,
  },
  left_sep = {
    str = assets.left_semicircle,
    hl = {
      fg = sett.curr_dir,
      bg = sett.bkg,
    },
  },

  right_sep = {
    str = assets.right_semicircle,
    hl = {
      fg = sett.curr_dir,
      bg = sett.bkg,
    },
  },
}

-- Diagnostics ------>
-- workspace loader
components[3][1] = {
  provider = 'lsp_client_names',
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  right_sep = invi_sep,
}
-- genral diagnostics (errors, warnings. info and hints)
components[3][2] = {
  provider = 'diagnostic_errors',
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.ERROR)
  end,

  hl = {
    fg = clrs.red,
    bg = sett.bkg,
  },
  icon = '  ',
}

components[3][3] = {
  provider = 'diagnostic_warnings',
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.WARN)
  end,
  hl = {
    fg = clrs.peach,
    bg = sett.bkg,
  },
  icon = '  ',
}

components[3][4] = {
  provider = 'diagnostic_info',
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.INFO)
  end,
  hl = {
    fg = clrs.yellow,
    bg = sett.bkg,
  },
  icon = '  ',
}

components[3][5] = {
  provider = 'diagnostic_hints',
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.HINT)
  end,
  hl = {
    fg = clrs.teal,
    bg = sett.bkg,
  },
  icon = ' ● ',
  right_sep = invi_sep,
}
-- ######## Right
components[3][6] = {
  provider = {
    name = 'file_type',

    opts = {
      -- filetype_icon = true,
      case = 'lowercase',
    },
  },
  hl = {
    bg = clrs.surface0,
    fg = clrs.flamingo,
  },
  left_sep = {
    str = assets.vertical_bar_chubby,
    hl = {
      bg = clrs.surface0,
      fg = clrs.surface0,
    },
  },
  right_sep = {
    str = assets.vertical_bar_chubby,
    hl = {
      bg = clrs.surface0,
      fg = clrs.surface0,
    },
  },
}

-- position
components[3][7] = {
  provider = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    -- Turn col from byte-index to column number and make it start from 1
    col = vim.str_utfindex(vim.api.nvim_get_current_line(), col) + 1

    return string.format(' %3d:%-2d', row, col)
  end,
  hl = vi_mode_hl,
}
-- file progress
components[3][8] = {
  provider = function()
    local current_line = vim.fn.line('.')
    local total_line = vim.fn.line('$')

    if current_line == 1 then
      return ' Top '
    elseif current_line == vim.fn.line('$') then
      return ' Bot '
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return ' ' .. result .. '%% '
  end,
  hl = vi_mode_hl,
}

require('feline').setup({
  components = {
    active = components,
    inactive = components,
  },
  -- preset = 'noicon',
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

-- winbar.active[1][1] = {
--   provider = function()
--     local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
--     return assets.dir .. dir_name .. ' '
--   end,
--   enabled = is_enabled(shortline, winid, 80),
--   hl = {
--     fg = sett.text,
--     bg = sett.curr_dir,
--   },
--   left_sep = {
--     str = assets.left_separator,
--     hl = {
--       fg = sett.curr_dir,
--       bg = sett.curr_file,
--     },
--   },
-- }

winbar.active[1][1] = {
  provider = {
    name = 'file_info',
    opts = {
      colored_icon = true,
      type = 'relative',
    },
  },
  enabled = function()
    return not diffview_enabled()
  end,
  hl = {
    fg = clrs.flamingo,
    bg = sett.bkg,
  },
}

winbar.active[1][2] = {
  provider = navic.get_location,
  enabled = function()
    return navic.is_available() and not diffview_enabled()
  end,
  hl = {
    bg = sett.bkg,
    fg = sett.text,
  },
  left_sep = {
    str = assets.slant_right,
  },

  right_sep = {
    str = assets.slant_left_2,
  },
}

winbar.active[1][3] = {
  enable = function()
    return not diffview_enabled()
  end,
  hl = {
    bg = sett.bkg,
  },
}
winbar.active[1][4] = {
  provider = {
    name = 'file_info',
    opts = {
      colored_icon = true,
      type = 'base-only',
    },
  },
  enabled = diffview_enabled,

  hl = get_diffview_color,
}

winbar.active[2][1] = {
  provider = diffview_buffer,
  enabled = diffview_enabled,
  hl = get_diffview_color,
}

winbar.inactive[1][1] = {
  provider = {
    name = 'file_info',
    opts = {
      colored_icon = true,
      type = 'relative',
    },
  },
  enabled = function()
    return not diffview_enabled()
  end,

  hl = {
    fg = clrs.overlay0,
    bg = sett.bkg,
  },
}

winbar.inactive[1][2] = {
  provider = {
    name = 'file_info',
    opts = {
      colored_icon = true,
      type = 'base-only',
    },
  },
  enabled = diffview_enabled,
  hl = get_diffview_color,
}

winbar.inactive[2][1] = {
  provider = diffview_buffer,
  enabled = diffview_enabled,
  hl = get_diffview_color,
}

require('feline').winbar.setup({
  components = {
    active = winbar.active,
    inactive = winbar.inactive,
  },
  -- eset = 'noicon',
})
