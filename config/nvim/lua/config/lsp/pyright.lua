local function determine_venv_path()
  local cwd = vim.fn.getcwd()
  if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
    return "venv"
  elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
    return ".venv"
  elseif vim.fn.executable(cwd .. "/env/bin/python") == 1 then
    return "env"
  else
    return vim.env.HOME .. "/.asdf/shims/python3"
  end
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
