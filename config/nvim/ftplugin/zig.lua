vim.lsp.start({
  name = "zls",
  cmd = { "zls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "build.zig" }, { upward = true })[1]),
  on_attach = require("config.lsp.on_attach").on_attach,
})
