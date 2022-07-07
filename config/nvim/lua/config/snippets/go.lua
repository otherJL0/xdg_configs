local luasnip = require('luasnip')
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet({ trig = 'fun', descr = 'function' }, {
    t({ 'func ' }),
    i(1),
    t({ '(' }),
    i(2),
    t({ ')' }),
    i(3),
    t({ '{', '    ' }),
    i(0),
    t({ '}' }),
  }),
  snippet({ trig = 'tstruct', descr = 'struct definition' }, {
    t({ 'type ' }),
    i(1),
    t({ ' struct {', '    ' }),
    i(0),
    t({ '}' }),
  }),
}
