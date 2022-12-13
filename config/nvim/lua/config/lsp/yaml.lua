return {
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
    }
  },
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/weaveworks/eksctl/e38fbde40caef8ac20ec315785bc3695d42ca47b/pkg/apis/eksctl.io/v1alpha5/assets/schema.json"] = {"cluster.yaml", "cluster.yml", "eksctl.yaml", "eksctl.yml"}
      }
    }
  }
}
