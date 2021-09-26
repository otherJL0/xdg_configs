local dial = require("dial")

dial.augends["custom#bool"] = dial.common.enum_cyclic({
  name = "boolean",
  strlist = { "true", "false" },
})

dial.augends["custom#Bool"] = dial.common.enum_cyclic({
  name = "boolean",
  strlist = { "True", "False" },
})

dial.augends["custom#BOOL"] = dial.common.enum_cyclic({
  name = "boolean",
  strlist = { "TRUE", "FALSE" },
})

table.insert(dial.config.searchlist.normal, "custom#bool")
table.insert(dial.config.searchlist.normal, "custom#Bool")
table.insert(dial.config.searchlist.normal, "custom#BOOL")

vim.cmd([[nmap <C-a> <Plug>(dial-increment)]])
vim.cmd([[nmap <C-x> <Plug>(dial-decrement)]])
vim.cmd([[vmap <C-a> <Plug>(dial-increment)]])
vim.cmd([[vmap <C-x> <Plug>(dial-decrement)]])
vim.cmd([[vmap g<C-a> <Plug>(dial-increment-additional)]])
vim.cmd([[vmap g<C-x> <Plug>(dial-decrement-additional)]])
