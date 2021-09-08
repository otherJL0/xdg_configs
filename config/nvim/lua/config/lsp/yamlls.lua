return {
  cmd = { "yaml-language-server", "--stdio" },
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
