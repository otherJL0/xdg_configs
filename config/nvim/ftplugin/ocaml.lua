vim.lsp.start({
  name = "ocaml-lsp",
  cmd = { "ocamllsp" },
  root_dir = vim.fs.dirname(vim.fs.find({ "dune", "dune-project" }, { upward = true })[1]),
  -- init_options = { },
  -- settings = { },
})
