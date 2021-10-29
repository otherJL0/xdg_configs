local luasnip = require("luasnip")
local snippets = luasnip.snippets
local snippet = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local events = require("luasnip.util.events")

snippets.lua = {
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

snippets.python = {
  snippet({ trig = "main", descr = [[if __name__ == "__main__"]] }, {
    t({
      [[def main():]],
      "    pass",
      "",
      "",
      [[if __name__ == "__main__":]],
      "    main()",
    }),
  }),
  snippet({ trig = "sqltable", descr = "class __TABLENAME__(SQLModel, table=True)" }, {
    t({ "class " }),
    i(1),
    t({
      "(SQLModel, table=True):",
      "    id: Optional[int] = Field(default=None, primary_key=True)",
      "    ",
    }),
    i(0),
  }),
}
snippets.javascript = {
  snippet({ trig = "rule", description = "grammar rule" }, {
    i(1),
    t({ ": $ => " }),
    i(0),
  }),
}
