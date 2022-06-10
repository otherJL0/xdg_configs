vim.lsp.start({
  name = "tsserver",
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json" }, { upward = true })[1]),
})

vim.lsp.start({
  name = "denols",
  cmd = { "deno", "lsp" },
  root_dir = vim.fs.dirname(vim.fs.find({ "denops/", "mod.ts", "app.tsx" }, { upward = true })[1]),
})
