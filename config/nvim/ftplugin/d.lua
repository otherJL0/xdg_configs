vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.start({
  name = "serve-d",
  cmd = { "serve-d" },
  root_dir = vim.fs.dirname(vim.fs.find({ "dub.json", "dub.sdl" }, { upward = true })[1]),
  on_attach = require("config.lsp.on_attach").on_attach,
  capabilities = capabilities,
})
