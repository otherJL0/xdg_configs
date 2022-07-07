local luasnip = require('luasnip')
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet({ trig = 'rule', description = 'grammar rule' }, {
    i(1),
    t({ ': $ => ' }),
    i(0),
  }),
}
