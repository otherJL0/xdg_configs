vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Add nvim/lua files to path
vim.opt.path:append(vim.fn.stdpath("config") .. "/lua")
vim.opt.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]

vim.cmd([[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("config.stylua").format()
  augroup END
]])
