local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers.new(opts, {
    prompt_title = prompt,
    finder = finders.new_table({
      results = items,
      entry_maker = function(entry)
        return {
          value = entry,
          display = label_fn(entry),
          ordinal = label_fn(entry),
        }
      end,
    }),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function()
      actions.goto_file_selection_edit:replace(function()
        local selection = actions.get_selected_entry()
        actions.close()

        cb(selection.value)
      end)

      return true
    end,
  }):find()
end

require("jdtls").start_or_attach(require("config.lsp.jdtls"))
