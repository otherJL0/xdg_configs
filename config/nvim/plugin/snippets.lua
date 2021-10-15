local ls = require("luasnip")
local snippets = ls.snippets
local snippet = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

snippets.lua = {
  snippet({ trig = "lreq", desc = "local require" }, {
    i(1),
    t({ "local " }),
    i(1),
    t({ [[ = require("]] }),
    i(2),
    t({ [[")]] }),
    i(0),
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
}
