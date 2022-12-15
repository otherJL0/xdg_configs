vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

require("config.lsp").lua()

ls.add_snippets("lua", {
  s({ trig = "lsp" }, {
    t({ [[vim.lsp.start({]], "" }),
    t({ [[  name = "]] }),
    i(1),
    t({ [[",]], "" }),
    t({ [[  cmd = { "]] }),
    i(2),
    t({ [[" },]], "" }),
    t({ [[  root_dir = vim.fs.dirname(vim.fs.find({ "]] }),
    i(3),
    t({ [[" }, { upward = true })[1])]], "" }),
    t({ [[  init_options = {]], "" }),
    t({ [[    ]] }),
    i(4),
    t({ "", "" }),
    t({ [[  },]], "" }),
    t({ [[  settings = {]], "" }),
    t({ [[    ]] }),
    i(5),
    t({ "", "" }),
    t({ [[  },]] }),
    i(0),
    t({ "", "" }),
    t({ [[}]] }),
  }),
}, {})
