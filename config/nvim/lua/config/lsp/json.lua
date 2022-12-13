return {
  name = "jsonls",
  cmd = { "vscode-json-language-server", "--stdio" },
  init_options = {
    provideFormatter = true,
  },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
