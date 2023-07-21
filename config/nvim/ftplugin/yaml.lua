vim.lsp.start({
  name = "yaml-language-server",
  cmd = { "yaml-language-server", "--stdio" },
  init_options = {
    yaml = {
      format = {
        enable = true,
      },
      validate = true,
      hover = true,
      completion = true,
    },
  },
  on_attach = require("config.lsp.on_attach").on_attach,
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      schemas = {
        ["https://raw.githubusercontent.com/weaveworks/eksctl/e38fbde40caef8ac20ec315785bc3695d42ca47b/pkg/apis/eksctl.io/v1alpha5/assets/schema.json"] = {
          "cluster.yaml",
          "cluster.yml",
          "eksctl.yaml",
          "eksctl.yml",
        },
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.15-standalone-strict/all.json"] = "deployments/*/*.yaml",
        1,
      },
    },
  },
})
