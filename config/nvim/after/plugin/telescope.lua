local nnoremap = vim.keymap.nnoremap
local ivy = require("config.telescope")

-- nnoremap({ "<C-f>", ivy.find_files })
-- nnoremap({ "<C-g>", ivy.live_grep })
-- nnoremap({ " <C-h>", ivy.man_pages })
-- nnoremap({ "<C-h>", ivy.help_tags })
-- nnoremap({ "<C-j>", ivy.file_browser })
-- nnoremap({ "<C-_>", ivy.vim_options })
nnoremap({ " ff", ivy.find_files })
nnoremap({ " fg", ivy.live_grep })
nnoremap({ " fh", ivy.help_tags })
nnoremap({ " fj", ivy.file_browser })
