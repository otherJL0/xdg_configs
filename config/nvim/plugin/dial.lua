local augend = require("dial.augend")

require("dial.config").augends:register_group({
  default = {
    augend.integer.alias.decimal,
    augend.date.alias["%m/%d"],

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "true", "false" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "True", "False" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "TRUE", "FALSE" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "on", "off" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "On", "Off" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "ON", "OFF" },
    }),
    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "yes", "no" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "Yes", "No" },
    }),

    augend.constant.new({
      word = true,
      cyclic = true,
      elements = { "YES", "NO" },
    }),
  },
})

-- table.insert(dial.config.searchlist.normal, "custom#bool")
-- table.insert(dial.config.searchlist.normal, "custom#Bool")
-- table.insert(dial.config.searchlist.normal, "custom#BOOL")
-- table.insert(dial.config.searchlist.normal, "custom#onoff")
-- table.insert(dial.config.searchlist.normal, "custom#OnOff")
-- table.insert(dial.config.searchlist.normal, "custom#ONOFF")

vim.cmd([[nmap <C-a> <Plug>(dial-increment)]])
vim.cmd([[nmap <C-x> <Plug>(dial-decrement)]])
vim.cmd([[vmap <C-a> <Plug>(dial-increment)]])
vim.cmd([[vmap <C-x> <Plug>(dial-decrement)]])
vim.cmd([[vmap g<C-a> <Plug>(dial-increment-additional)]])
vim.cmd([[vmap g<C-x> <Plug>(dial-decrement-additional)]])
