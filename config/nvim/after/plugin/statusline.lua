local vi_mode_utils = require("feline.providers.vi_mode")

local active = {
  ----------
  -- LEFT --
  ----------
  {
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
        fg = "black",
        bg = "white",
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
        bg = "white",
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
        fg = "black",
        bg = "white",
      },
    },
  },
}

require("feline").setup({
  components = {
    active = active,
    inactive = inactive,
  },
})
