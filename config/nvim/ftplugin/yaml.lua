vim.lsp.start({
  name = 'yamlls',
  cmd = { vim.fn.stdpath('cache') .. '/node_modules/.bin/yaml-language-server', '--stdio' },
  init_options = {
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
  --   vim.notify(vim.inspect(initilize_params))
  --   vim.notify(vim.inspect(config))
  -- end,
  on_init = function(client, initialization_result)
    client.server_capabilities.documentFormattingProvider = true
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
