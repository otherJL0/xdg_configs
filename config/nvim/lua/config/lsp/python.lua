local M = {}
local current_file = vim.api.nvim_buf_get_name(0)
local venv =
  vim.fs.find({ "env", ".venv", "venv", ".env" }, { path = current_file, upward = true, type = "directory" })[1]

M.name = "pyright"
M.cmd = { "pyright-langserver", "--stdio" }
M.root_dir = vim.fs.dirname(
  vim.fs.find(
    { "requirements.txt", "pyproject.toml", "setup.cfg", "setup.py" },
    { path = current_file, upward = true, type = "file" }
  )[1]
)

M.settings = {
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
        reportMissingTypeStubs = "none",
        reportPropertyTypeMismatch = "warning",
        reportUninitializedInstanceVariable = "warning",
        reportUnknownMemberType = "warning",
        reportUnknownVariableType = "warning",
        reportUnnecessaryTypeIgnoreComment = "warning",
        reportUnusedCallResult = false,
      },
    },
  },
}

if venv then
  M.settings.python.pythonPath = venv .. "/bin/python"
  vim.env.VIRTUAL_ENV = venv
end

return M
