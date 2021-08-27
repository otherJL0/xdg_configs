local nnoremap = vim.keymap.nnoremap

nnoremap({ "<C-f>", require("config.telescope").find_files })
nnoremap({ "<C-g>", require("config.telescope").live_grep })
nnoremap({ " <C-h>", require("config.telescope").man_pages })
nnoremap({ "<C-h>", require("config.telescope").help_tags })
nnoremap({ "<C-j>", require("config.telescope").file_browser })
nnoremap({ "<C-_>", require("config.telescope").vim_options })
