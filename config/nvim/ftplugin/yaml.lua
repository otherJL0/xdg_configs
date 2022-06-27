vim.lsp.start({
  name = "yamlls",
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/yaml-language-server", "--stdio" },
  settings = {
    yaml = {
      format = {
        enable = true,
        singleQuote = true,
      },
      hover = true,
      schemaStore = {
        enable = true,
      },
      editor = {
        formatOnType = true,
      },
    },
  },
})
