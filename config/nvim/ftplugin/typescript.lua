vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

local current_file = vim.api.nvim_buf_get_name(0)
local node_root_dir = vim.fs.dirname(
  vim.fs.find({ 'tsconfig.json' }, { path = current_file, upward = true, type = 'file' })[1]
)

local deno_root_dir = vim.fs.dirname(
  vim.fs.find(
    { 'init.ts', 'deno.jsonc', 'dev.ts', 'deno.json', 'import_map.json' },
    { path = current_file, upward = true, type = 'file' }
  )[1]
)

if node_root_dir then
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

  local prettierrc = vim.fs.find(
    { '.prettierrc' },
    { path = node_root_dir, upward = true, type = 'file' }
  )[1]
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
  vim.notify(vim.inspect(prettierrc))
  vim.lsp.start({
    name = 'tsserver',
    cmd = {
      vim.fn.stdpath('cache') .. '/node_modules/.bin/typescript-language-server',
      '--stdio',
    },
    root_dir = node_root_dir,
    init_options = tsserver.init_options,
    settings = tsserver.settings,
  })
end

if deno_root_dir then
  vim.lsp.start({
    name = 'denols',
    cmd = { 'deno', 'lsp' },
    root_dir = deno_root_dir,
  })
end
