local luasnip = require("luasnip")
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet({ trig = "==", descr = "equality" }, {
    t({ [[{"==": []] }),
    i(0),
    t({ [[]}]] }),
  }),
  snippet({ trig = "var", descr = "{var: value}" }, {
    t({ [[{"var": "]] }),
    i(0),
    t({ [["}]] }),
  }),
  snippet({ trig = "visible", descr = "visible" }, {
    t({ [[{"visible": ]] }),
    i(0),
    t({ [[}]] }),
  }),
}
