vim.lsp.start({
  name = "gopls",
  cmd = { "gopls", "--remote=auto" },
  root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", "go.sum" }, { upward = true })[1]),
  init_options = {
    codelenses = {
      gc_details = true,
      generate = true,
      regenerate_cgo = true,
      test = true,
      tidy = true,
      upgrade_dependency = true,
      vendor = true,
    },
    gofumpt = true,
    usePlaceholders = true,
    semanticTokens = true,
    staticcheck = true,
    -- hoverKind = "Structured",
    hoverKind = "FullDocumentation",
  },
})
