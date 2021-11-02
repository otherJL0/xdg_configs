local nnoremap = vim.keymap.nnoremap
local actions = require("telescope.actions")
-- require("telescope").extensions.packer.plugins()
-- require("telescope").load_extension("projects")
-- require("telescope").load_extension("frecency")
-- require("telescope").load_extension("cheat")
-- require("telescope").load_extension("smart_history")
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

nnoremap({ " ff", ivy.git_files })
nnoremap({ " fg", ivy.live_grep })
nnoremap({ " fG", ivy.grep_string })
nnoremap({ " fh", ivy.help_tags })
nnoremap({ " fj", ivy.file_browser })
nnoremap({ " fm", ivy.man_pages })
nnoremap({ "gI", ivy.lsp_implementations })
