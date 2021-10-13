vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Add nvim/lua files to path
vim.opt.path:append(vim.fn.stdpath("config") .. "/lua")
-- Add packer fles to path
vim.opt.path:append(vim.fn.stdpath("data") .. "/site/pack/packer/*/*/lua")
vim.opt.suffixesadd:append("/init.lua")

vim.opt.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]

vim.opt.includeexpr = string.gsub(vim.v.fname, "%.", "/")
vim.cmd([[set includeexpr=substitute(v:fname,'\\.','/','g')]])

-- vim.cmd([[
--   augroup StyluaAuto
--     autocmd BufWritePre *.lua :lua require("config.stylua").format()
--   augroup END
-- ]])
