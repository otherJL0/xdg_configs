local function determine_venv_path()
  local cwd = vim.fn.getcwd()
  for _, venv in ipairs({ "venv", ".venv", "env" }) do
    candidate_path = string.format("%s/%s/bin/python", cwd, venv)
    if vim.fn.executable(candidate_path) == 1 then
      return venv
    end
  end
  return vim.env.HOME .. "/.asdf/shims/python3"
end

return {
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/" .. "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      venvPath = determine_venv_path(),
      pythonPath = determine_venv_path() .. "/bin/python",
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
          reportUnknownVariableType = "warning",
          reportUnnecessaryTypeIgnoreComment = "warning",
          reportUnusedCallResult = false,
        },
      },
    },
  },
  single_file_support = true,
  root_dir = require("lspconfig.util").root_pattern(
    "env",
    ".venv/",
    "pyproject.toml",
    "pyright.json",
    "setup.cfg",
    "setup.py",
    "src/"
  ),
}
