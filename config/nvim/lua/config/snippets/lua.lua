local luasnip = require("luasnip")
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet({ trig = "inspect", descr = "vim.notify(vim.inspect())" }, {
    t({ "vim.notify(vim.inspect(" }),
    i(0),
    t({ "))" }),
  }),
  snippet({ trig = "lsnip", desc = "lua snippet" }, {
    t({ [[snippet({ trig = "]] }),
    i(1),
    t({ [[", descr = "]] }),
    i(2),
    t({ [["}, {]], "  " }),
    i(0),
    t({ ",", "})," }),
  }),
  snippet({ trig = "lreq", desc = "local require" }, {
    t({ "local " }),
    i(1),
    t({ [[ = require("]] }),
    i(2),
    t({ [[")]] }),
    i(0),
  }),
  snippet({ trig = "lfun", desc = "local function" }, {
    t({ "local function " }),
    i(1),
    t({ "(" }),
    i(2),
    t({ ")", "  " }),
    i(0),
    t({ "", "end" }),
  }),
  snippet({ trig = "tab", desc = "{}" }, {
    i(1),
    t({ " = {", "  " }),
    i(0),
    t({ "", "}" }),
  }),
  snippet({ trig = "ltab", desc = "local {}" }, {
    t({ "local " }),
    i(1),
    t({ " = {", "  " }),
    i(0),
    t({ "", "}" }),
  }),
}
