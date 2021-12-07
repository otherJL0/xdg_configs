vim.bo.lisp = true
-- vim.cmd([[setl commentstring=#\|\ %s\ \|#]])
-- vim.cmd([[setl comments=:;;;;,:;;;,:;;,:;]])
vim.bo.comments = ":;;;;,:;;;,:;;,:;"
vim.bo.commentstring = ";; %s"

vim.bo.makeprg = "raco make -- %"
