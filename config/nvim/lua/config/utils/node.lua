local M = {}
local function apply_prettierrc_configs(root_dir, tsserver)
  local prettierrc =
    vim.fs.find({ '.prettierrc' }, { path = root_dir, upward = true, type = 'file' })[1]
  if prettierrc then
    local rcfile = io.open(prettierrc, 'r')
    local options = vim.json.decode(rcfile:read('*a'))
    rcfile:close()
    if options.singleQuote ~= nil then
      if options.singleQuote then
        tsserver.init_options.preferences.quotePreference = 'double'
      else
        tsserver.init_options.preferences.quotePreference = 'single'
      end
    end

    if options.useTabs ~= nil then
      tsserver.settings.typescript.format.convertTabsToSpaces = not options.useTabs
    end

    if options.tabWidth ~= nil then
      tsserver.settings.typescript.format.indentSize = options.tabWidth
      tsserver.settings.typescript.format.tabSize = options.tabWidth
    end
  end
  return tsserver
end

function M.setup(root_dir)
  local tsserver = {
    init_options = {
      hostinfo = 'neovim',
      preferences = {},
    },
    settings = {
      typescript = {
        format = {},
      },
    },
  }

  tsserver = apply_prettierrc_configs(root_dir, tsserver)

  vim.lsp.start({
    name = 'tsserver',
    cmd = {
      vim.fn.stdpath('cache') .. '/node_modules/.bin/typescript-language-server',
      '--stdio',
    },
    root_dir = root_dir,
    init_options = tsserver.init_options,
    settings = tsserver.settings,
  })

  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = '*test*',
    callback = function()
      local jest_config =
        vim.fs.find({ 'jest.config.cjs' }, { path = root_dir, upward = true, type = 'file' })[1]
      require('neotest').setup({
        adapters = {
          require('neotest-jest')({
            jestCommand = 'npm test --',
            jestConfigFile = jest_config,
          }),
        },
      })
    end,
  })
end

return M
