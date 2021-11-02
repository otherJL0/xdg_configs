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
  root_dir = require("lspconfig.util").root_pattern("denops/", "package.json", "tsconfig.json", "mod.ts", "app.tsx"),
}
