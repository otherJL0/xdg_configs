if vim.g.neovide == nil then
  return
end

vim.opt.shell = '/opt/homebrew/bin/bash'

-- vim.g.neovide_transparency = 0.8
vim.g.neovide_input_use_logo = false
-- vim.opt.guifont = "JetBrains Mono Regular Nerd Font Complete Mono:h12"
-- vim.opt.guifont = "JetBrains Mono Nerd Font"
vim.opt.guifont = 'JetBrainsMono Nerd Font Mono:h11'
vim.g.guioptions = 'aceimrlb'
vim.g.neovide_cursor_vfx_mode = 'sonicboom'
