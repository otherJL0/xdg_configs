return {
  cmd = { "rome", "lsp" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "json",
    "rjson",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
  },
  root_dir = require("lspconfig.util").root_pattern("package.json", "node_modules", "rome.rjson"),
}
