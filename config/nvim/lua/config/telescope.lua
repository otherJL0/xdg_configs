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
  },
})

for _, extension in ipairs({
  'file_browser',
  'fzf',
  'live_grep_args',
}) do
  telescope.load_extension(extension)
end

-- Return a new instance style table instead to avoid telescope issues
local styles = {
  default = function()
    return {}
  end,
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
  dropdown = function()
    return themes.get_dropdown({
      layout_config = {
        preview_cutoff = 1, -- Preview should always show (unless previewer = false)

        height = function(_, _, max_lines)
          return math.min(max_lines, 20)
        end,

        width = function(_, max_columns, _)
          return math.min(max_columns, 80)
        end,
      },
    })
  end,
  cursor = function()
    return themes.get_cursor()
  end,
}

return setmetatable({}, {
  __index = function(_, style)
    return setmetatable({ theme = styles[style]() }, {
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
