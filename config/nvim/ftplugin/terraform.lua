vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

vim.lsp.set_log_level(0)
vim.lsp.start({
  name = 'terraform-ls',
  cmd = {
    'terraform-ls',
    'serve',
  },
  init_options = {
    ignoreSingleFileWarning = true,
    experimentalFeatures = {
      validateOnSave = true,
      prefillRequiredFields = true,
    },
  },
  root_dir = vim.fs.dirname(vim.fs.find({ '.terraform/', '.terraform.lock.hcl' })[1]),
})

local luasnip = require('luasnip')
local snippet = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

luasnip.add_snippets('terraform', {
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
  snippet({ trig = 'dat', descr = [[data "PROVIDER_TYPE" "NAME" {}]] }, {
    t({ [[data "]] }),
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
  snippet({ trig = 'out', descr = [[output "NAME" {}]] }, {
    t({ [[output "]] }),
    i(1),
    t({ [[" {]] }),
    i(0),
    t({ [[}]] }),
  }),
})
