local vi_mode_utils = require("feline.providers.vi_mode")
local cp_api = require("catppuccin.api.colors")
local cp_style = require("catppuccin.core.mapper").apply().base
local colors = cp_api.get_colors()
colors.white = colors.catppuccin0
colors.green = colors.catppuccin7
colors.red = colors.catppuccin2
colors.violet = colors.catppuccin4
colors.magenta = colors.catppuccin5
colors.yellow = colors.catppuccin8
colors.orange = colors.catppuccin6
colors.blue = colors.catppuccin9
colors.cyan = colors.catppuccin10
colors.comment = cp_style.Comment.fg

local vi_mode_colors = {
  NORMAL = colors.green,
  INSERT = colors.red,
  VISUAL = colors.magenta,
  OP = colors.green,
  BLOCK = colors.blue,
  REPLACE = colors.violet,
  ["V-REPLACE"] = colors.violet,
  ENTER = colors.cyan,
  MORE = colors.cyan,
  SELECT = colors.orange,
  COMMAND = colors.green,
  SHELL = colors.green,
  TERM = colors.green,
  NONE = colors.yellow,
}

local active = {
  ----------
  -- LEFT --
  ----------
  {
    {
      provider = function()
        return vim.g.minor_mode .. " "
      end,
    },
    {
      provider = "vi_mode",
      icon = "",
      hl = function()
        return {
          name = vi_mode_utils.get_mode_highlight_name(),
          fg = vi_mode_utils.get_mode_color(),
          style = "BOLD",
        }
      end,
      right_sep = " ",
    },
    { provider = "git_branch" },
    { provider = "git_diff_added" },
    { provider = "git_diff_removed" },
    { provider = "git_diff_changed" },
    {
      provider = {
        name = "file_info",
        opts = {
          type = "relative",
        },
      },
      icon = "",
    },
  },

  -----------
  -- RIGHT --
  -----------
  {
    {
      provider = function()
        return require("lsp-status").status()
      end,
    },
    { provider = "lsp_client_names", right_sep = " " },
    { provider = "position", right_sep = ":" },
    { provider = "line_percentage" },
  },
}

local inactive = {
  ----------
  -- LEFT --
  ----------
  {
    {
      provider = function()
        return "-- INACTIVE --"
      end,
      hl = {
        fg = colors.bg_highlight,
        bg = colors.comment,
      },
    },
  },
  ------------
  -- MIDDLE --
  ------------
  {
    {
      provider = {
        name = "file_info",
        opts = {
          type = "relative",
        },
      },
      hl = {
        fg = "black",
        bg = colors.comment,
      },
    },
  },
  -----------
  -- RIGHT --
  -----------
  {
    {
      provider = function()
        return "-- INACTIVE --"
      end,
      hl = {
        fg = colors.bg_highlight,
        bg = colors.comment,
      },
    },
  },
}

require("feline").setup({
  default_bg = colors.bg_highlight,
  components = {
    active = active,
    inactive = inactive,
  },
  vi_mode_colors = vi_mode_colors,
})
