vim.bo.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.lsp.start({
  name = "clangd",
  cmd = { "clangd" },
  root_dir = vim.fs.dirname(
    vim.fs.find(
      { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt" },
      { upward = true }
    )[1]
  ),
  on_attach = require("config.lsp.on_attach").on_attach,
})
