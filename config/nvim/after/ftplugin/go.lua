vim.lsp.start({
  name = "gopls",
  cmd = { "gopls", "--remote=auto" },
  root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", "go.sum" }, { upward = true })[1]),
})
