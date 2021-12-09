-- TODO: Need to add those sweet sweet lsp workspace diagnostic counts

RELOAD("el")
require("el").reset_windows()

local builtin = require("el.builtin")
local extensions = require("el.extensions")
local sections = require("el.sections")
local subscribe = require("el.subscribe")
local lsp_statusline = require("el.plugins.lsp_status")

local git_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, bufnr)
  local icon = extensions.file_icon(_, bufnr)
  if icon then
    return icon .. " "
  end

  return ""
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return " " .. extensions.git_icon() .. " " .. branch
  end
end)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
  return extensions.git_changes(window, buffer)
end)

local show_current_func = function(window, buffer)
  if buffer.filetype == "lua" then
    return ""
  end

  return lsp_statusline.current_function(window, buffer)
end

require("el").setup({
  generator = function(_, _)
    local mode = extensions.gen_mode({ format_string = " %s " })

    local items = {
      { mode, required = true },
      { git_branch },
      { " " },
      { sections.split, required = true },
      { git_icon },
      -- { sections.maximum_width(builtin.responsive_file(140, 90), 0.40), required = true },
      { sections.collapse_builtin({ { " " }, { builtin.modified_flag } }) },
      { sections.split, required = true },
      { show_current_func },
      { lsp_statusline.server_progress },
      -- { ws_diagnostic_counts },
      { git_changes },
      { "[" },
      { builtin.line_with_width(3) },
      { ":" },
      { builtin.column_with_width(2) },
      { "]" },
      {
        sections.collapse_builtin({
          "[",
          builtin.help_list,
          builtin.readonly_list,
          "]",
        }),
      },
      { builtin.filetype },
    }

    return items
  end,
})
