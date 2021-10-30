return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "strict",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
