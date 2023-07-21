local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.start({
  name = "rust-analyzer",
  cmd = { "rust-analyzer" },
  root_dir = vim.fs.dirname(vim.fs.find({ "Cargo.toml" }, { upward = true })[1]),
  on_attach = require("config.lsp.on_attach").on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
      check = {
        command = "clippy",
      },
      inlayHints = {
        bindingModeHints = {
          enable = true,
        },
        closureCaptureHints = {
          enable = true,
        },
      },
    },
  },
})
