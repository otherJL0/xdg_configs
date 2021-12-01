local telescope = require("telescope")
local themes = require("telescope.themes")
local nnoremap = vim.keymap.nnoremap
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["<C-c>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      themes.get_cursor({}),
    },
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    project = {
      base_dirs = {
        { path = "~/gh", max_depth = 3 },
        { path = "~/exercism", max_depth = 3 },
      },
      hidden_files = false, -- default: false
    },
  },
})

telescope.load_extension("ui-select")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")

local ivy = setmetatable({}, {
  __index = function(_, function_call)
    local ok, call = pcall(function()
      return function()
        telescope.extensions[function_call][function_call](themes.get_ivy({}))
      end
    end)
    if not ok then
      return function()
        require("telescope.builtin")[function_call](themes.get_ivy({}))
      end
    end
    return call
  end,
})

nnoremap({ " ff", ivy.git_files })
nnoremap({ " fg", ivy.live_grep_raw })
nnoremap({ " fG", ivy.grep_string })
nnoremap({ " fh", ivy.help_tags })
nnoremap({ " fj", ivy.file_browser })
nnoremap({ " fm", ivy.man_pages })
nnoremap({ "gI", ivy.lsp_implementations })
nnoremap({ " fp", ivy.project })
