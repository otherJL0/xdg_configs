vim.lsp.start({
  name = "zls",
  cmd = { vim.fn.stdpath("cache") .. "/zls/zig-out/bin/zls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "build.zig" }, { upward = true })[1]),
})
