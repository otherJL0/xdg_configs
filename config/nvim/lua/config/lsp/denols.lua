return {
  cmd = { "deno", "lsp" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
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
  },
  settings = {
    codeLens = {
      implementations = true,
      references = true,
      referencesAllFunctions = true,
      -- test = true,
    },
    suggest = {
      autoImports = true,
      completeFunctionCalls = true,
      names = true,
      paths = true,
      imports = {
        autoDiscover = true,
        hosts = true,
      },
    },
  },
  root_dir = require("lspconfig.util").root_pattern("denops/", "mod.ts", "app.tsx"),
}
