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
  snippet({ trig = "dclass", descr = "dataclass" }, {
    t({ "@dataclass", "class " }),
    i(1),
    t({ ":", "    " }),
    i(0),
  }),
  snippet({ trig = "Def", descr = "def func_name" }, {
    t({ "def " }),
    i(1),
    t({ "(" }),
    i(2),
    t({ ")" }),
    i(3),
    t({ ":", "    " }),
    i(0),
  }),
  snippet({ trig = "lcomp", descr = "list comprehension" }, {
    t({ "[" }),
    i(1),
    t({ " for " }),
    i(2),
    t({ " in " }),
    i(3),
    t({ "]" }),
    i(0),
  }),
  snippet({ trig = "Class", descr = "class" }, {
    t({ "class " }),
    i(1),
    t({ ":", "    def __init__(self" }),
    i(2),
    t({ "):", "        " }),
    i(0),
  }),
  snippet({ trig = "itertools", descr = "import itertools" }, {
    t({ "import itertools as it", "" }),
    i(0),
  }),
  snippet({ trig = "numpy", descr = "import numpy" }, {
    t({ "import numpy as np", "" }),
    i(0),
  }),
  snippet({ trig = "pandas", descr = "import pandas" }, {
    t({ "import pandas as pd", "" }),
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

snippets.go = {
  snippet({ trig = "fun", descr = "function" }, {
    t({ "func " }),
    i(1),
    t({ "(" }),
    i(2),
    t({ ")" }),
    i(3),
    t({ "{", "    " }),
    i(0),
    t({ "}" }),
  }),
  snippet({ trig = "tstruct", descr = "struct definition" }, {
    t({ "type " }),
    i(1),
    t({ " struct {", "    " }),
    i(0),
    t({ "}" }),
  }),
}
