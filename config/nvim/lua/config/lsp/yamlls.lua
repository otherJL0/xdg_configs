return {
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      completion = true,
      validate = true,
      format = {
        enable = true,
        bracketSpacing = true,
      },
    },
  },
}
