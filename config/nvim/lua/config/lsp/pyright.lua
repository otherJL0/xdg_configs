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
        diagnosticSeverityOverrides = {
          reportCallInDefaultInitializer = "warning",
          reportImplicitStringConcatenation = "warning",
          -- reportMissingSuperCall = "warning",
          reportPropertyTypeMismatch = "warning",
          reportUninitializedInstanceVariable = "warning",
          reportUnnecessaryTypeIgnoreComment = "warning",
          reportUnusedCallResult = "warning",
        },
      },
    },
  },
  single_file_support = true,
  root_dir = require("lspconfig.util").root_pattern(
    "__init__.py",
    "__main__.py",
    "main.py",
    "pyproject.toml",
    "pyright.json",
    "setup.cfg",
    "setup.py",
    "src/"
  ),
}
