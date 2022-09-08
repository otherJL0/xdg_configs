local luasnip = require('luasnip')
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  snippet({ trig = 'res', descr = [[resource "PROVIDER_TYPE" "NAME" {}]] }, {
    t({ [[resource "]] }),
    i(1),
    t({ '_' }),
    i(2),
    t({ [[" "]] }),
    i(3),
    t({ [[" {]], [[  ]] }),
    i(0),
    t({ [[]], [[}]] }),
  }),
  snippet({ trig = 'pro', descr = [[provider "NAME" {}]] }, {
    t({ [[provider "]] }),
    i(1),
    t({ [[" {]], [[  ]] }),
    i(0),
    t({ [[]], [[}]] }),
  }),
  snippet({ trig = 'var', descr = [[variable "NAME" {}]] }, {
    t({ [[variable "]] }),
    i(1),
    t({ [[" {]] }),
    i(0),
    t({ [[}]] }),
  }),
}
