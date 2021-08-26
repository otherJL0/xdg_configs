local nnoremap = vim.keymap.nnoremap
local gitsigns = require('gitsigns')

nnoremap({'gsp', gitsigns.preview_hunk})
nnoremap({'gsu', gitsigns.undo_stage_hunk})
nnoremap({'gss', gitsigns.stage_hunk})
nnoremap({'gsS', gitsigns.stage_buffer})
nnoremap({'gsr', gitsigns.reset_hunk})
nnoremap({'gsR', gitsigns.reset_buffer})
nnoremap({'gsb', gitsigns.blame_line})
nnoremap({'gs]', gitsigns.next_hunk})
nnoremap({'gs[', gitsigns.preview_hunk})
