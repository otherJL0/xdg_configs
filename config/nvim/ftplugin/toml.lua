vim.lsp.start({
  name = "taplo",
  cmd = { "taplo", "lsp", "stdio" },
  on_attach = require("config.lsp.on_attach").on_attach,
  root_dir = vim.fs.dirname(vim.fs.find({ "*.toml" }, { upward = true })[1]),
})
