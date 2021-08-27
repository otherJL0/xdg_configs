return {
  cmd = { "deno", "lsp" },
  filetypes = {
    "typescript",
  },
  -- handlers = {
  --   ["textDocument/definition"] =
  --   ["textDocument/references"] = <function 1>
  -- },
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
  },
  root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
}
