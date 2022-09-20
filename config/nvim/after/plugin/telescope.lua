-- Nested metatable interface for personal telescope configs
local telescope = setmetatable({}, {
  __index = function(_, theme)
    return setmetatable({ theme = theme }, {
      __index = function(self, function_call)
        return require('config.telescope')[self.theme][function_call]
      end,
    })
  end,
})

vim.keymap.set('n', ' ff', telescope.ivy.find_files)
vim.keymap.set('n', ' fF', telescope.ivy.git_files)
vim.keymap.set('n', ' fg', telescope.ivy.live_grep_args)
vim.keymap.set('n', ' fG', telescope.cursor.grep_string)
vim.keymap.set('n', ' fh', telescope.ivy.help_tags)
vim.keymap.set('n', ' fj', telescope.dropdown.file_browser)
vim.keymap.set('n', ' fb', telescope.dropdown.buffers)
vim.keymap.set('n', ' fm', telescope.ivy.man_pages)
