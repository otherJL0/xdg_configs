vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.cmd([[
  augroup JqxPopulate
    autocmd BufRead *.json :JqxList
  augroup END
]])
