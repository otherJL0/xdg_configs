vim.bo.makeprg = 'py %'

vim.bo.efm = '%C %.%#,%A  File "%f"\\, line %l%.%#,%Z%[%^ ]%\\@=%m'

vim.bo.autoindent = true
vim.bo.smartindent = true

-- local function determine_venv_path()
--   return vim.fs.find({ '.venv', 'venv', '.env', 'env' }, { upward = true })[1]
-- end

vim.lsp.start({
  name = 'pyright',
  cmd = {
    vim.fn.stdpath('cache') .. '/node_modules/.bin/' .. 'pyright-langserver',
    '--stdio',
  },
  root_dir = vim.fs.dirname(vim.fs.find({
    'env',
    '.venv/',
    'pyproject.toml',
    'setup.cfg',
    'setup.py',
    'requirements.txt',
  }, { upward = true })[1]),
  settings = {
    python = {
      -- venvPath = determine_venv_path(),
      -- pythonPath = determine_venv_path() .. '/bin/python',
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = 'workspace',
        typeCheckingMode = 'strict',
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          reportCallInDefaultInitializer = 'warning',
          reportImplicitStringConcatenation = 'warning',
          reportMissingTypeStubs = 'none',
          reportPropertyTypeMismatch = 'warning',
          reportUninitializedInstanceVariable = 'warning',
          reportUnknownMemberType = 'warning',
          reportUnknownVariableType = 'warning',
          reportUnnecessaryTypeIgnoreComment = 'warning',
          reportUnusedCallResult = false,
        },
      },
    },
  },
})
