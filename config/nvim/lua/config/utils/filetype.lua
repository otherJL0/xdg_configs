local M = {}

function M.detect_project_type()
  local current_file = vim.api.nvim_buf_get_name(0)
  local deno_root_dir = vim.fs.dirname(
    vim.fs.find(
      { 'init.ts', 'deno.jsonc', 'dev.ts', 'deno.json', 'import_map.json' },
      { path = current_file, upward = true, type = 'file' }
    )[1]
  )
  local node_root_dir = vim.fs.dirname(
    vim.fs.find({ 'tsconfig.json' }, { path = current_file, upward = true, type = 'file' })[1]
  )
  if deno_root_dir ~= nil and node_root_dir ~= nil then
    vim.notify('Detected project root files for both deno and node projects')
    return nil
  elseif deno_root_dir ~= nil then
    return { type = 'deno', root_dir = deno_root_dir }
  elseif node_root_dir ~= nil then
    return { type = 'node', root_dir = node_root_dir }
  end
  return nil
end

local function apply_prettierrc_configs(root_dir, tsserver)
  local prettierrc = vim.fs.find(
    { '.prettierrc' },
    { path = root_dir, upward = true, type = 'file' }
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
  return tsserver
end

M.setup_project = {
  node = function(root_dir)
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
        local jest_config = vim.fs.find(
          { 'jest.config.cjs' },
          { path = root_dir, upward = true, type = 'file' }
        )[1]
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
  end,
  deno = function(root_dir)
    local function buf_cache()
      local params = {
        referrer = {
          uri = vim.uri_from_bufnr(0),
        },
        uris = {},
      }
      vim.lsp.buf_request(0, 'deno/cache', params, nil)
    end

    local function virtual_text_document_handler(uri, result)
      if not result then
        return nil
      end

      for _, res in pairs(result) do
        -- Error might be present because of race, deno server will eventually send a result. #1995
        if res.error ~= nil then
          require('vim.lsp.log').warn(
            'deno/virtual_text_document handler failed (might be a temporary issue), error: '
              .. tostring(res.error)
          )
        else
          local lines = vim.split(res.result, '\n')
          local bufnr = vim.uri_to_bufnr(uri)

          local current_buf = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
          if #current_buf ~= 0 then
            return nil
          end

          vim.api.nvim_buf_set_lines(bufnr, 0, -1, nil, lines)
          vim.api.nvim_buf_set_option(bufnr, 'readonly', true)
          vim.api.nvim_buf_set_option(bufnr, 'modified', false)
          vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
        end
      end
    end

    local function virtual_text_document(uri)
      local params = {
        textDocument = {
          uri = uri,
        },
      }
      local result = lsp.buf_request_sync(0, 'deno/virtualTextDocument', params)
      virtual_text_document_handler(uri, result)
    end

    local function denols_handler(err, result, ctx)
      if not result or vim.tbl_isempty(result) then
        return nil
      end

      for _, res in pairs(result) do
        local uri = res.uri or res.targetUri
        if uri:match('^deno:') then
          virtual_text_document(uri)
          res['uri'] = uri
          res['targetUri'] = uri
        end
      end

      vim.lsp.handlers[ctx.method](err, result, ctx)
      vim.lsp.handlers[ctx.method](err, result, ctx)
    end

    vim.lsp.start({
      name = 'denols',
      cmd = { 'deno', 'lsp' },
      root_dir = root_dir,
      init_options = {
        enable = true,
        unstable = true,
      },
      handlers = {
        ['textDocument/definition'] = denols_handler,
        ['textDocument/references'] = denols_handler,
      },
      commands = {
        DenolsCache = {
          function()
            buf_cache()
          end,
          description = 'Cache a module and all its dependencies',
        },
      },
    })
  end,
}

function M.setup_node_project() end

return M
