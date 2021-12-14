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

local buffer_position = function()
  local result = {
    "[",
    builtin.line_with_width(3),
    ":",
    builtin.column_with_width(3),
    "]",
  }
  return vim.fn.join(result)
end

local attached_buffers = function()
  local result = {}
  for _, lsp_client in ipairs(vim.lsp.get_active_clients()) do
    table.insert(result, lsp_client.name)
  end
  return "[" .. vim.fn.join(result, "][") .. "]"
end

local function workspace_directory()
  local directories = vim.lsp.buf.list_workspace_folders()
  if #directories == 0 then
    return ""
  end

  return vim.fn.fnamemodify(directories[1], ":t") .. "/"
end

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
        { workspace_directory },
        { builtin.file_relative },
        { sections.split, required = true },
      },

      -----------
      -- RIGHT --
      -----------
      {
        -- { lsp_status.status() },
        { require("el.plugins.lsp_status").segment },
        { attached_buffers },
        { buffer_position },
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
