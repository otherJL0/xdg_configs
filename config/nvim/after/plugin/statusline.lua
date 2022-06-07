local lsp = require("feline.providers.lsp")
local lsp_severity = vim.diagnostic.severity

local function get_python_version(venv)
  for _, version in ipairs({ "3.11", "3.10", "3.9", "3.8", "3.7", "3.6" }) do
    if vim.fn.getftype(string.format("%s/bin/python%s", venv, version)) ~= "" then
      return version
    end
  end
  return "unknown"
end

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

vim.opt.laststatus = 3

local assets = {
  left_semicircle = "",
  right_semicircle = "",
  right_semicircle_cut = "",
  left_semicircle_cut = "",
  vertical_bar_chubby = "█",
  vertical_bar_medium = "┃",
  vertical_bar_thin = "│",
  left_arrow_thin = "",
  right_arrow_thin = "",
  left_arrow_filled = "",
  right_arrow_filled = "",
  slant_left = "",
  slant_left_thin = "",
  slant_right = "",
  slant_right_thin = "",
  slant_left_2 = "",
  slant_left_2_thin = "",
  slant_right_2 = "",
  slant_right_2_thin = "",
  chubby_dot = "●",
  slim_dot = "•",
}

local clrs = require("catppuccin.api.colors").get_colors()

-- settings
local sett = {
  bkg = clrs.base,
  diffs = clrs.mauve,
  extras = clrs.text,
  curr_file = clrs.maroon,
  curr_dir = clrs.flamingo,
}

local mode_colors = {
  ["n"] = { "NORMAL", clrs.lavender },
  ["no"] = { "N-PENDING", clrs.lavender },
  ["i"] = { "INSERT", clrs.green },
  ["ic"] = { "INSERT", clrs.green },
  ["t"] = { "TERMINAL", clrs.green },
  ["v"] = { "VISUAL", clrs.flamingo },
  ["V"] = { "V-LINE", clrs.flamingo },
  [""] = { "V-BLOCK", clrs.flamingo },
  ["R"] = { "REPLACE", clrs.maroon },
  ["Rv"] = { "V-REPLACE", clrs.maroon },
  ["s"] = { "SELECT", clrs.maroon },
  ["S"] = { "S-LINE", clrs.maroon },
  [""] = { "S-BLOCK", clrs.maroon },
  ["c"] = { "COMMAND", clrs.peach },
  ["cv"] = { "COMMAND", clrs.peach },
  ["ce"] = { "COMMAND", clrs.peach },
  ["r"] = { "PROMPT", clrs.teal },
  ["rm"] = { "MORE", clrs.teal },
  ["r?"] = { "CONFIRM", clrs.mauve },
  ["!"] = { "SHELL", clrs.green },
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
  str = " ",
  hl = {
    fg = sett.bkg,
    bg = sett.bkg,
  },
}

-- helpers

-- Current vi mode ------>
local vi_mode_hl = function()
  return {
    fg = sett.bkg,
    bg = mode_colors[vim.fn.mode()][2],
    style = "bold",
  }
end

local vi_mode_hl_inv = function()
  return {
    bg = sett.bkg,
    fg = mode_colors[vim.fn.mode()][2],
    style = "bold",
  }
end

components[1][1] = {
  provider = function()
    -- return " " .. mode_colors[vim.fn.mode()][1] .. " "
    return " "
  end,
  hl = vi_mode_hl,
}

components[1][2] = {
  provider = "git_branch",
  enabled = is_enabled(shortline, nil, 70),
  hl = {
    bg = clrs.surface0,
    fg = clrs.text,
  },
  icon = "  ",
  -- left_sep = {
  --   str = assets.vertical_bar_chubby,
  -- },
  right_sep = {
    str = assets.vertical_bar_chubby,
  },
}

-- Diffs ------>
components[1][3] = {
  provider = "git_diff_added",
  hl = {
    fg = clrs.green,
    bg = sett.bkg,
  },
  icon = "  ",
}

components[1][4] = {
  provider = "git_diff_changed",
  hl = {
    fg = clrs.yellow,
    bg = sett.bkg,
  },
  icon = "  ",
}

components[1][5] = {
  provider = "git_diff_removed",
  hl = {
    fg = clrs.red,
    bg = sett.bkg,
  },
  icon = "  ",
}

components[2][1] = {
  hl = {
    bg = sett.bkg,
  },
}
components[2][2] = {
  provider = function()
    local venv = vim.split(vim.env.VIRTUAL_ENV, "/", { trimempty = true })
    return string.format("%s(%s)", venv[#venv], get_python_version(vim.env.VIRTUAL_ENV))
  end,

  enabled = vim.env.VIRTUAL_ENV ~= nil,

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
  hl = {
    bg = sett.bkg,
  },
}
-- Diagnostics ------>
-- workspace loader
components[3][1] = {
  provider = "lsp_client_names",
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  right_sep = invi_sep,
}
-- genral diagnostics (errors, warnings. info and hints)
components[3][2] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.ERROR)
  end,

  hl = {
    fg = clrs.red,
    bg = sett.bkg,
  },
  icon = "  ",
}

components[3][3] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.WARN)
  end,
  hl = {
    fg = clrs.peach,
    bg = sett.bkg,
  },
  icon = "  ",
}

components[3][4] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.INFO)
  end,
  hl = {
    fg = clrs.yellow,
    bg = sett.bkg,
  },
  icon = "  ",
}

components[3][5] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.HINT)
  end,
  hl = {
    fg = clrs.teal,
    bg = sett.bkg,
  },
  icon = " ● ",
  right_sep = invi_sep,
}
-- ######## Right
components[3][6] = {
  provider = {
    name = "file_type",

    opts = {
      -- filetype_icon = true,
      case = "lowercase",
    },
  },
  hl = {
    bg = clrs.surface0,
    fg = clrs.text,
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

    return string.format(" %3d:%-2d", row, col)
  end,
  hl = vi_mode_hl,
}
-- file progress
components[3][8] = {
  provider = function()
    local current_line = vim.fn.line(".")
    local total_line = vim.fn.line("$")

    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line("$") then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,
  hl = vi_mode_hl,
}

require("feline").setup({
  components = {
    active = components,
    inactive = components,
  },
  preset = "noicon",
})

local winbar_active = {
  {},
}

winbar_active[1][2] = {
  provider = require("nvim-gps").get_location,
  enabled = require("nvim-gps").is_available,
  hl = {
    bg = clrs.surface0,
    fg = clrs.text,
  },
  left_sep = {
    str = assets.slant_left_2,
  },

  right_sep = {
    str = assets.right_semicircle,
  },
}

winbar_active[1][1] = {
  provider = {
    name = "file_info",
    opts = {
      colored_icon = true,
      type = "relative",
    },
  },
  hl = vi_mode_hl_inv,

  left_sep = {
    str = assets.slant_left,
  },
  right_sep = {
    str = assets.slant_right,
  },
}
winbar_active[1][3] = {
  hl = {
    bg = clrs.base,
  },
}

local winbar_inactive = {
  {},
}

winbar_inactive[1][1] = {

  provider = {
    name = "file_info",
    opts = {
      colored_icon = true,
      type = "relative",
    },
  },

  hl = {
    fg = clrs.overlay0,
    bg = clrs.base,
  },
}
require("feline").winbar.setup({
  components = {
    active = winbar_active,
    inactive = winbar_inactive,
  },
  preset = "noicon",
})
