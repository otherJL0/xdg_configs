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
  root_dir = vim.fs.dirname(vim.fs.find({ ".git/", "README.md" }, { upward = true })[1]),
})
