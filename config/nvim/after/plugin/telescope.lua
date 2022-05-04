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

for _, extension in ipairs({ "ui-select", "file_browser", "fzf", "live_grep_raw", "gh" }) do
  telescope.load_extension(extension)
end

-- Return a new instance of the opt table instead of re-using
local opts = function()
  return themes.get_ivy({
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,
    },
  })
end

local ivy = setmetatable({
  project_files = function()
    local ok = pcall(require("telescope.builtin").git_files, opts())
    if not ok then
      require("telescope.builtin").find_files(opts())
    end
  end,
}, {
  __index = function(_, function_call)
    local extensions = vim.tbl_keys(telescope.extensions)
    if vim.tbl_contains(extensions, function_call) then
      return function()
        local ivy_opts = opts()
        telescope.extensions[function_call][function_call](ivy_opts)
      end
    end
    return function()
      require("telescope.builtin")[function_call](opts())
    end
  end,
})

-- vim.keymap.set("n", " ff", ivy.project_files)
-- vim.keymap.set("n", " ff", ivy.find_files)
vim.keymap.set("n", " ff", ivy.git_files)
vim.keymap.set("n", " fg", ivy.live_grep_raw)
vim.keymap.set("n", " fG", ivy.grep_string)
vim.keymap.set("n", " fh", ivy.help_tags)
-- vim.keymap.set("n", " fj", ivy.file_browser)
vim.keymap.set("n", " fm", ivy.man_pages)
vim.keymap.set("n", "gI", ivy.lsp_implementations)
-- vim.keymap.set("n", " fp", ivy.project )
-- vim.keymap.set("n", " fp", function()
--   local config = themes.get_ivy({})
--   config.display_type = "full"
--   telescope.extensions.project.project(config)
-- end)
