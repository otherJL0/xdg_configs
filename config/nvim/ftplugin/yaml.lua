vim.lsp.start({
  name = "yamlls",
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/yaml-language-server", "--stdio" },
  init_options = {
    yaml = {
      format = {
        enable = true,
        singleQuote = true,
        bracketSpacing = true,
        -- proseWrap = "always",
        -- printWidth = 80,
      },
      validate = true,
      hover = true,
      completion = true,
      schemas = {
        ["https://raw.githubusercontent.com/bitnami/charts/master/bitnami/mariadb/values.schema.json"] = "/charts/mariadb/values/*.yaml",
        -- ["https://json.schemastore.org/helmfile.json"] = "/*.yaml",
        -- ["https://json.schemastore.org/helmfile.json"] = "/charts/helmfile.yaml",
        -- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        -- ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.yaml",
      },
      schemaStore = {
        enable = true,
      },
      editor = {
        formatOnType = true,
      },
    },
  },
  on_init = function(client)
    client.server_capabilities.documentFormattingProvider = true
  end,
  on_attach = function(_, _)
    vim.notify("Attaching")
    vim.api.nvim_create_user_command("GetJsonSchema", function()
      vim.lsp.buf_request(0, "yaml/get/jsonSchema", vim.fn.expand("%:p"), function(err, result, ctx, config)
        vim.notify(vim.inspect(err))
        vim.notify(vim.inspect(result))
        vim.notify(vim.inspect(ctx))
        vim.notify(vim.inspect(config))
      end)
    end, {})
  end,
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", "README.md" }, { upward = true })[1]),
})
