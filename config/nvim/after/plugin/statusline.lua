local vi_mode_utils = require("feline.providers.vi_mode")

local active = {
  left = {},
  middle = {},
  right = {},
}

active.left = {
  {
    provider = "vi_mode",
    icon = "",
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        bg = vi_mode_utils.get_mode_color(),
        style = "none",
      }
    end,
    right_sep = " ",
  },

  { provider = "git_branch" },
  { provider = "git_diff_added" },
  { provider = "git_diff_removed" },
  { provider = "git_diff_changed" },
}

active.right = {
  { provider = "position" },
  { provider = "line_percentage" },
}

require("feline").setup({
  components = {
    active = {
      active.left,
      active.middle,
      active.right,
    },
    inactive = {
      {},
      {},
      {},
    },
  },
})
