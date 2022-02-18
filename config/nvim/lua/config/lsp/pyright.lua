return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      venvPath = "./.venv",
      pythonPath = "./.venv/bin/python",
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "strict",
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportCallInDefaultInitializer = "warning",
          reportImplicitStringConcatenation = "warning",
          reportMissingTypeStubs = "warning",
          reportPropertyTypeMismatch = "warning",
          reportUninitializedInstanceVariable = "warning",
          reportUnknownMemberType = "warning",
          reportUnnecessaryTypeIgnoreComment = "warning",
          reportUnusedCallResult = false,
        },
      },
    },
  },
  single_file_support = true,
  root_dir = require("lspconfig.util").root_pattern(
    ".venv/",
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
