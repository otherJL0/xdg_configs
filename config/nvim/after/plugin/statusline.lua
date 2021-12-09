RELOAD("el")
require("el").reset_windows()

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local sections = require("el.sections")

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return " " .. extensions.git_icon() .. " " .. branch
  end
end)

require("el").setup({
  generator = function(_, _)
    local mode = extensions.gen_mode({ format_string = " %s " })

    local segments = {
      ----------
      -- LEFT --
      ----------
      {
        { mode, required = true },
        { git_branch },
      },

      ------------
      -- MIDDLE --
      ------------
      {
        { sections.split, required = true },
        { builtin.file_relative },
        { sections.split, required = true },
      },

      -----------
      -- RIGHT --
      -----------
      {
        { builtin.line_with_width(3) },
        { ":" },
        { builtin.column_with_width(3) },
        { builtin.filetype },
      },
    }

    local result = {}
    for _, el_component in ipairs(segments) do
      vim.list_extend(result, el_component)
    end

    return result
  end,
})
