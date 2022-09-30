local telescope = require('telescope')
local themes = require('telescope.themes')

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
    project = {
      base_dirs = { vim.fn.stdpath('data') .. '/site/pack/' , max_depth = 1},
    }
  },
})

for _, extension in ipairs({
  'file_browser',
  'fzf',
  'live_grep_args',
  'project'
}) do
  telescope.load_extension(extension)
end

-- Return a new instance style table instead to avoid telescope issues
local styles = {

  ---@return default Telescope layout
  default = function()
    return {}
  end,

  ---@return Layout at bottom of screen
  ivy = function()
    return themes.get_ivy({
      layout_config = {
        preview_cutoff = 1, -- Preview should always show (unless previewer = false)

        height = function(_, _, max_lines)
          return math.min(math.floor(max_lines / 2), 30)
        end,
      },
    })
  end,

  ---@return Centered layout at top of screen
  dropdown = function()
    return themes.get_dropdown({
      layout_config = {
        preview_cutoff = 1, -- Preview should always show (unless previewer = false)

        height = function(_, _, max_lines)
          return math.min(max_lines, 20)
        end,

        width = function(_, max_columns, _)
          return math.floor(max_columns*0.75)
        end,
      },
    })
  end,

  ---@return Layout close to cursor position
  cursor = function()
    return themes.get_cursor()
  end,
}

return setmetatable({}, {
  ---@param _ table: self
  ---@param style string: Any of default, ivy, dropdown, or cursor
  ---@return table: Metatable with a set style
  __index = function(_, style)
    return setmetatable({ theme = styles[style]() }, {
      ---@param self table: self
      ---@param function_call string: Any telescope function call
      ---@return callback
      __index = function(self, function_call)
        local extensions = vim.tbl_keys(telescope.extensions)
        if vim.tbl_contains(extensions, function_call) then
          return function()
            telescope.extensions[function_call][function_call](self.theme)
          end
        end
        return function()
          require('telescope.builtin')[function_call](self.theme)
        end
      end,
    })
  end,
})
