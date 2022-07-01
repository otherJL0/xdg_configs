vim.lsp.start({
  name = "svelteserver",
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/" .. "svelteserver", "--stdio" },
  root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json" }, { upward = true })[1]),
})
