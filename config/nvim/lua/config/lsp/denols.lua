return {
  cmd = { "deno", "lsp" },
  filetypes = {
    "typescript",
    "typescriptreact",
    "tsx",
  },
  -- handlers = {
  --   ["textDocument/definition"] =
  --   ["textDocument/references"] = <function 1>
  -- },
  init_options = {
    enable = true,
    lint = true,
    unstable = true,
    importMap = "import_map.json",
    codeLens = {
      implementations = true,
      references = true,
    },
    suggest = {
      autoImports = true,
      completeFunctionCalls = true,
      names = true,
      paths = true,
    },
  },
  root_dir = require("lspconfig.util").root_pattern(
    "package.json",
    "tsconfig.json",
    ".git",
    "import_map.json",
    "app.tsx"
  ),
}
