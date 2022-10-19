local M = {}

local function apply_deno_configs(root_dir, configs)
  local deno_config =
    vim.fs.find({ 'deno.json' }, { path = root_dir, upward = true, type = 'file' })[1]
  local options = {}
  if deno_config then
    local rcfile = io.open(deno_config, 'r')
    options = vim.json.decode(rcfile:read('*a'))
    rcfile:close()
  else
    return configs
  end

  if options.importMap then
    configs.importMap = options.importMap
  end
  return configs
end

local function buf_cache(bufnr)
  local params = {
    referrer = {
      uri = vim.uri_from_bufnr(bufnr),
    },
    uris = {},
  }
  vim.lsp.buf_request(bufnr, 'deno/cache', params, function(_) end)
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

function M.setup(root_dir)
  configs = apply_deno_configs(root_dir, configs)
  vim.lsp.start({
    name = 'denols',
    cmd = { 'deno', 'lsp' },
    root_dir = root_dir,
    settings = {
      deno = {
        enable = true,
        unstable = true,
        enablePaths = true,
        codeLens = {
          test = true,
        },
        suggest = {
          completeFunctionCalls = true,
          names = true,
          paths = true,
          autoImports = true,
          imports = {
            autoDiscover = true,
            hosts = true,
          },
        },
      },
    },
    handlers = {
      ['textDocument/definition'] = denols_handler,
      ['textDocument/references'] = denols_handler,
      ['workspace/executeCommand'] = function(err, result, context)
        if context.params.command == 'deno.cache' then
          buf_cache(0)
        else
          vim.lsp.handlers[context.method](err, result, context)
        end
      end,
    },
    commands = {
      DenolsCache = {
        function()
          buf_cache(0)
        end,
        description = 'Cache a module and all its dependencies',
      },
    },
  })
end

return M
