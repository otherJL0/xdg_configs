vim.bo.makeprg = 'py %'

vim.bo.efm = '%C %.%#,%A  File "%f"\\, line %l%.%#,%Z%[%^ ]%\\@=%m'

vim.bo.autoindent = true
vim.bo.smartindent = true

local current_file = vim.api.nvim_buf_get_name(0)
local venv = vim.fs.dirname(
  vim.fs.find(
    { 'env', '.venv', 'venv', '.env' },
    { path = current_file, upward = true, type = 'directory' }
  )[1]
)

local root_dir = vim.fs.dirname(
  vim.fs.find(
    { 'requirements.txt', 'pyproject.toml', 'setup.cfg', 'setup.py' },
    { path = current_file, upward = true, type = 'file' }
  )[1]
)

local pyright_settings = {
  python = {
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
}

if venv then
  pyright_settings['venvPath'] = venv
end
-- local function determine_venv_path()
--   return vim.fs.find({ '.venv', 'venv', '.env', 'env' }, { upward = true })[1]
-- end

vim.lsp.start({
  name = 'pyright',
  cmd = {
    vim.fn.stdpath('cache') .. '/node_modules/.bin/' .. 'pyright-langserver',
    '--stdio',
  },
  root_dir = root_dir,
  init_options = pyright_settings,
})

local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting

local tool_configs = {
  isort = {
    command = vim.fn.stdpath('cache') .. '/.venv/bin/isort',
  },
  black = {
    command = vim.fn.stdpath('cache') .. '/.venv/bin/black',
  },
}

-- local pyproject_toml = vim.fs.find(
--   { 'pyproject.toml' },
--   { path = current_file, upward = true, type = 'file' }
-- )[1]
-- if pyproject_toml ~= nil then
--   tool_configs.isort.extra_args = { '--settings-file', pyproject_toml }
--   tool_configs.black.extra_args = { '--config', pyproject_toml }
-- end

null_ls.setup({

  sources = {
    -- Fromatting
    formatting.isort.with(tool_configs.isort),
    formatting.black.with(tool_configs.black),
  },
  default_timeout = 20000,
})
