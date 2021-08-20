local builtin = require('el.builtin')
local extensions = require('el.extensions')
local sections = require('el.sections')
local subscribe = require('el.subscribe')
-- local lsp_statusline = require('el.plugins.lsp_status')
local lsp_status = require('lsp-status')
local helper = require('el.helper')

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

local buffer_percentage = function()
    local fraction = math.floor(
      100 * vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
    )
    local percentage = string.format('%d%%%%', fraction)
    if fraction < 10 then
      return '  ' .. percentage
    elseif fraction < 100 then
      return ' ' .. percentage
    else
      return percentage
    end
end

require('el').setup({
  generator = function(window, buffer)
    local left = {
      extensions.gen_mode({format_string =(' %s ') }),
      git_icon,
      git_branch,
      git_changes
    }

    local middle = {
      lsp_status.status
    }

    local right = {
      '[',
      builtin.line_with_width(3),
      '/',
      function() return vim.api.nvim_buf_line_count(buffer) end,
      '(',
      buffer_percentage,
      ')',
      ']'
    }

    return vim.tbl_flatten({left, {sections.split}, middle, {sections.split}, right})
  end
})
