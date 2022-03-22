local telescope = require("telescope")
local themes = require("telescope.themes")
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

local opts = themes.get_ivy({
  layout_config = {
    preview_cutoff = 1, -- Preview should always show (unless previewer = false)

    width = function(_, max_columns, _)
      return math.min(max_columns, 80)
    end,
  },
})
local ivy = setmetatable({
  project_files = function()
    local ok = pcall(require("telescope.builtin").git_files, opts)
    if not ok then
      require("telescope.builtin").find_files(opts)
    end
  end,
}, {
  __index = function(_, function_call)
    return function()
      require("telescope.builtin")[function_call](opts)
    end
  end,
})

-- vim.keymap.set("n", " ff", ivy.project_files)
vim.keymap.set("n", " ff", ivy.find_files)
vim.keymap.set("n", " fg", function()
  telescope.extensions.live_grep_raw.live_grep_raw(opts)
end)
vim.keymap.set("n", " fG", ivy.grep_string)
vim.keymap.set("n", " fh", ivy.help_tags)
-- vim.keymap.set("n", " fj", function()
--   telescope.extensions.file_browser.file_browser(opts)
-- end)
-- vim.keymap.set("n", " fj", ivy.file_browser)
vim.keymap.set("n", " fm", ivy.man_pages)
vim.keymap.set("n", "gI", ivy.lsp_implementations)
-- vim.keymap.set("n", " fp", ivy.project )
vim.keymap.set("n", " fp", function()
  local config = themes.get_ivy({})
  config.display_type = "full"
  telescope.extensions.project.project(config)
end)
