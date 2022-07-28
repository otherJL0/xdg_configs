vim.lsp.start({
  name = 'yamlls',
  cmd = { 'yaml-language-server', '--stdio' },
  settings = {
    schemas = {
      kubernetes = { '*' },
    },
    yaml = {
      format = {
        enable = true,
        singleQuote = true,
        bracketSpacing = true,
        proseWrap = 'always',
        printWidth = 80,
      },
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = true,
      },
      editor = {
        formatOnType = true,
      },
    },
  },
  -- before_init = function(initilize_params, config)
  --   -- vim.notify(vim.inspect(initilize_params))
  --   -- vim.notify(vim.inspect(config))
  --   -- vim.notify(vim.inspect(vim.bo.filetype))
  -- end,
  on_init = function(client, initialization_result)
    -- vim.notify(vim.inspect(vim.opt.filetype))
    -- vim.notify(vim.inspect(initialization_result))
    client.server_capabilities.documentFormattingProvider = vim.bo.filetype ~= 'gotmpl'
  end,
  on_attach = function(_, _)
    vim.api.nvim_create_user_command('GetJsonSchema', function()
      vim.lsp.buf_request(0, 'yaml/get/jsonSchema', { vim.uri_from_bufnr(0) }, nil)
    end, {})
  end,
  root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'README.md' }, { upward = true })[1]),
  handlers = {
    ['yaml/get/jsonSchema'] = function(err, result, ctx, config)
      if vim.tbl_isempty(result) then
        vim.notify('Schema is not recognized')
      end

      for _, schema in ipairs(result) do
        vim.notify(schema.description, 'info', { title = schema.name })
      end
    end,
  },
})
