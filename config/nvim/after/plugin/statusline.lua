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
local lsp = require("feline.providers.lsp")
local lsp_severity = vim.diagnostic.severity
local b = vim.b

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

local clrs = require("catppuccin.core.color_palette")

-- settings
local sett = {
  bkg = clrs.black3,
  diffs = clrs.mauve,
  extras = clrs.gray1,
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
  active = {},
  inactive = {},
}

table.insert(components.active, {}) -- (1) left
table.insert(components.active, {}) -- (2) center
-- table.insert(components.active, {}) -- (3) right

-- global components
local invi_sep = {
  str = " ",
  hl = {
    fg = sett.bkg,
    bg = sett.bkg,
  },
}

-- helpers
local function any_git_changes()
  local gst = b.gitsigns_status_dict -- git stats
  if gst then
    for _, status in ipairs({ "added", "removed", "chained" }) do
      if gst[status] and gst[status] then
        return true
      end
    end
  end
  return false
end

-- #################### STATUSLINE ->

-- ######## Left

-- Current vi mode ------>
local vi_mode_hl = function()
  return {
    fg = sett.bkg,
    bg = mode_colors[vim.fn.mode()][2],
    style = "bold",
  }
end

-- components.active[1][1] = {
--   provider = assets.vertical_bar_thin,
--   hl = function()
--     return {
--       fg = mode_colors[vim.fn.mode()][2],
--       bg = sett.bkg,
--     }
--   end,
-- }

-- components.active[1][2] = {
--   provider = "",
--   hl = function()
--     return {
--       fg = sett.bkg,
--       bg = mode_colors[vim.fn.mode()][2],
--     }
--   end,
-- }

components.active[1][1] = {
  provider = function()
    return " " .. mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = vi_mode_hl,
}

-- there is a dilema: we need to hide Diffs if ther is no git info. We can do that, but this will
-- leave the right_semicircle colored with purple, and since we can't change the color conditonally
-- then the solution is to create two right_semicircles: one with a mauve sett.bkg and the other one normal
-- sett.bkg; both have the same fg (vi mode). The mauve one appears if there is git info, else the one with
-- the normal sett.bkg appears. Fixed :)

-- enable if git diffs are not available
-- components.active[1][3] = {
--   provider = assets.vertical_bar_thin,
--   hl = function()
--     return {
--       fg = mode_colors[vim.fn.mode()][2],
--       bg = sett.bkg,
--     }
--   end,
--   enabled = function()
--     return not any_git_changes()
--   end,
-- }

-- enable if git diffs are available
-- components.active[1][4] = {
--   provider = assets.vertical_bar_thin,
--   hl = function()
--     return {
--       fg = mode_colors[vim.fn.mode()][2],
--       bg = sett.diffs,
--     }
--   end,
--   enabled = function()
--     return any_git_changes()
--   end,
-- }
-- Current vi mode ------>

components.active[1][2] = {
  provider = "git_branch",
  enabled = is_enabled(shortline, winid, 70),
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  icon = "  ",
  left_sep = invi_sep,
  right_sep = invi_sep,
}

-- Diffs ------>
components.active[1][3] = {
  provider = "git_diff_added",
  hl = {
    fg = clrs.green,
    bg = sett.bkg,
  },
  icon = "  ",
}

components.active[1][4] = {
  provider = "git_diff_changed",
  hl = {
    fg = clrs.yellow,
    bg = sett.bkg,
  },
  icon = "  ",
}

components.active[1][5] = {
  provider = "git_diff_removed",
  hl = {
    fg = clrs.red,
    bg = sett.bkg,
  },
  icon = "  ",
}

-- Diagnostics ------>
-- workspace loader
components.active[2][1] = {
  provider = "lsp_client_names",
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  right_sep = invi_sep,
}
components.active[2][2] = {
  provider = function()
    local Lsp = vim.lsp.util.get_progress_messages()[1]

    if Lsp then
      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {
        "",
        "",
        "",
      }
      local success_icon = {
        "",
        "",
        "",
      }
      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners

      if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
      end

      return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
    end

    return ""
  end,
  enabled = is_enabled(shortline, winid, 80),
  hl = {
    fg = clrs.rosewater,
    bg = sett.bkg,
  },
}

-- genral diagnostics (errors, warnings. info and hints)
components.active[2][3] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.ERROR)
  end,

  hl = {
    fg = clrs.red,
    bg = sett.bkg,
  },
  icon = " E:",
}

components.active[2][4] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.WARN)
  end,
  hl = {
    fg = clrs.peach,
    bg = sett.bkg,
  },
  icon = " W:",
}

components.active[2][5] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.INFO)
  end,
  hl = {
    fg = clrs.yellow,
    bg = sett.bkg,
  },
  icon = " I:",
}

components.active[2][6] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist(lsp_severity.HINT)
  end,
  hl = {
    fg = clrs.teal,
    bg = sett.bkg,
  },
  icon = " H:",
  right_sep = invi_sep,
}
-- Diagnostics ------>

-- ######## Center

-- ######## Right

-- position
components.active[2][7] = {
  provider = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    -- Turn col from byteindex to column number and make it start from 1
    col = vim.str_utfindex(vim.api.nvim_get_current_line(), col) + 1

    return string.format(" %3d:%-2d", row, col)
  end,
  hl = vi_mode_hl,
}
-- file progess
components.active[2][8] = {
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
  components = components,
  preset = "noicon",
})
