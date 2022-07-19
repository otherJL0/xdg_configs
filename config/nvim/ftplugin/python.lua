vim.bo.makeprg = 'py %'

vim.bo.efm = '%C %.%#,%A  File "%f"\\, line %l%.%#,%Z%[%^ ]%\\@=%m'

vim.bo.autoindent = true
vim.bo.smartindent = true

-- local pyright_augroup = vim.api.nvim_create_augroup('Pyright', {})
local current_file = vim.api.nvim_buf_get_name(0)
local venv = vim.fs.find(
  { 'env', '.venv', 'venv', '.env' },
  { path = current_file, upward = true, type = 'directory' }
)[1]

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
  pyright_settings.python.pythonPath = venv .. '/bin/python'
  vim.env.VIRTUAL_ENV = venv
end

vim.lsp.start({
  name = 'pyright',
  cmd = {
    vim.fn.stdpath('cache') .. '/node_modules/.bin/' .. 'pyright-langserver',
    '--stdio',
  },
  root_dir = root_dir,
  settings = pyright_settings,
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

null_ls.setup({
  sources = {
    formatting.isort.with(tool_configs.isort),
    formatting.black.with(tool_configs.black),
  },
  default_timeout = 20000,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*test*',
  callback = function()
    require('neotest').setup({
      adapters = {
        require('neotest-python')({}),
      },
    })
  end,
})
