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

local M = setmetatable({}, {
  __index = function(_, function_call)
    return function()
      require("telescope.builtin")[function_call](require("telescope.themes").get_ivy({}))
    end
  end,
})
return M
