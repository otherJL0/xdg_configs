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

dial.augends["custom#onoff"] = dial.common.enum_cyclic({
  name = "boolean",
  strlist = { "on", "off" },
})

dial.augends["custom#OnOff"] = dial.common.enum_cyclic({
  name = "boolean",
  strlist = { "On", "Off" },
})

dial.augends["custom#ONOFF"] = dial.common.enum_cyclic({
  name = "boolean",
  strlist = { "ON", "OFF" },
})

table.insert(dial.config.searchlist.normal, "custom#bool")
table.insert(dial.config.searchlist.normal, "custom#Bool")
table.insert(dial.config.searchlist.normal, "custom#BOOL")
table.insert(dial.config.searchlist.normal, "custom#onoff")
table.insert(dial.config.searchlist.normal, "custom#OnOff")
table.insert(dial.config.searchlist.normal, "custom#ONOFF")

vim.cmd([[nmap <C-a> <Plug>(dial-increment)]])
vim.cmd([[nmap <C-x> <Plug>(dial-decrement)]])
vim.cmd([[vmap <C-a> <Plug>(dial-increment)]])
vim.cmd([[vmap <C-x> <Plug>(dial-decrement)]])
vim.cmd([[vmap g<C-a> <Plug>(dial-increment-additional)]])
vim.cmd([[vmap g<C-x> <Plug>(dial-decrement-additional)]])
