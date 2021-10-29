local nnoremap = vim.keymap.nnoremap
local actions = require("telescope.actions")
require("telescope").load_extension("projects")
require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["<C-c>"] = actions.close,
      },
    },
  },
})

local ivy = setmetatable({}, {
  __index = function(_, function_call)
    return function()
      require("telescope.builtin")[function_call](require("telescope.themes").get_ivy({}))
    end
  end,
})

nnoremap({ " ff", ivy.find_files })
nnoremap({ " fg", ivy.live_grep })
nnoremap({ " fh", ivy.help_tags })
nnoremap({ " fj", ivy.file_browser })
nnoremap({ "gI", ivy.lsp_implementations })
