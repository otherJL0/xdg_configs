vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = false

-- require("config.lsp").go()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.start({
  name = "gopls",
  cmd = { "gopls", "--remote=auto" },
  root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", "go.sum" }, { upward = true })[1]),
  on_attach = require("config.lsp.on_attach").on_attach,
  capabilities = capabilities,
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
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
  },
})
