vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local pyright_settings = {
  python = {
    analysis = {
      -- extraPaths = {"server"},
      autoImportCompletions = true,
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      -- basic, strict
      typeCheckingMode = "basic",
      useLibraryCodeForTypes = true,
      -- diagnosticSeverityOverrides = {
      --   reportCallInDefaultInitializer = "warning",
      --   reportImplicitStringConcatenation = "warning",
      --   reportMissingTypeStubs = "none",
      --   reportPropertyTypeMismatch = "warning",
      --   reportUninitializedInstanceVariable = "warning",
      --   reportUnknownMemberType = "warning",
      --   reportUnknownVariableType = "warning",
      --   reportUnnecessaryTypeIgnoreComment = "warning",
      --   reportUnusedCallResult = false,
      -- },
    },
  },
}

local venv = vim.fs.find(
  { "env", ".venv", "venv", ".env" },
  { path = vim.api.nvim_buf_get_name(0), upward = true, type = "directory" }
)[1]

if venv ~= nil then
  pyright_settings.python.venvPath = venv
end

vim.lsp.start({
  name = "pyright",
  cmd = { "pyright-langserver", "--stdio" },
  on_attach = require("config.lsp.on_attach").on_attach,
  root_dir = vim.fs.dirname(vim.fs.find({
    "Pipfile",
    "pyproject.toml",
    "requirements.in",
    "requirements.txt",
    "setup.cfg",
    "setup.py",
  }, { upward = true })[1]),
  -- init_options = {},
  settings = pyright_settings,
})

local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = { justMyCode = false },
      -- Command line arguments for runner
      -- Can also be a function to return dynamic values
      args = { "--log-level", "DEBUG" },
      -- Runner to use. Will use pytest if available by default.
      -- Can be a function to return dynamic value.
      runner = "pytest",
      -- Custom python path for the runner.
      -- Can be a string or a list of strings.
      -- Can also be a function to return dynamic value.
      -- If not provided, the path will be inferred by checking for
      -- virtual envs in the local directory and for Pipenev/Poetry configs
      -- python = ".venv/bin/python",
      -- Returns if a given file path is a test file.
      -- NB: This function is called a lot so don't perform any heavy tasks within it.
    }),
  },
  icons = {
    failed = "",
    passed = "",
    running = "",
    skipped = "",
    unknown = "",
  },
})

vim.api.nvim_buf_create_user_command(0, "Pytest", function()
  neotest.run.run()
end, {})
