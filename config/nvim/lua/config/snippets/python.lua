local luasnip = require("luasnip")
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet({ trig = "main", descr = [[if __name__ == "__main__]] }, {
    t({ "def main():", "    return" }),
    i(0),
    t({ "", "", "", [[if __name__ == "__main__":]], "    main()" }),
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
  snippet({ trig = "def", descr = "def func_name" }, {
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
  snippet({ trig = "class", descr = "class" }, {
    t({ "class " }),
    i(1),
    t({ ":", "    def __init__(self" }),
    i(2),
    t({ "):", "        " }),
    i(0),
  }),
  snippet({ trig = "tclass", descr = "class (unittest.TestCase):" }, {
    t({ "class Test" }),
    i(1),
    t({ "(unittest.TestCase):", "    def test_" }),
    i(2),
    t({ "(self):", "        " }),
    i(0),
    t({ "", "", [[if  __name__ == "__main__":]], "    unittest.main()" }),
  }),
  snippet({ trig = "test_case" }, {
    t({ "def test_" }),
    i(1),
    t({ "(self):", "    " }),
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
  snippet({ trig = "enum", descr = "_ = auto()" }, {
    i(0),
    t({ " = auto()" }),
  }),
  snippet({ trig = "pvar", descr = [[print(f"{VARNAME=}")]] }, {
    t({ [[print(f"{]] }),
    i(0),
    t({ [[=}")]] }),
  }),
  snippet({ trig = "command", descr = [[@app.command()]] }, {
    t({ [[@app.command()]], "def " }),
    i(0),
    t({ [[() -> None:]], [[    typer.secho("Command")]] }),
  }),
}
