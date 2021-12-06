return {
  filetypes = { "ruby" },
  init_options = {
    formatting = true,
  },
  settings = {
    solargraph = {
      autoformat = true,
      formatting = true,
      diagnostics = true,
      transport = "stdio",
      useBundler = true,
    },
  },
}
