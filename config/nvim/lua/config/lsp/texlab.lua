return {
  cmd = { "texlab" },
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        executable = "tectonic",
        args = {
          "%f",
          "--synctex",
          "--keep-logs",
          "--keep-intermediates",
        },
        forwardSearchAfter = true,
        onSave = true,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        executable = "okular",
        args = { "--unique", "file:%p#src:%l%f" },
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },
}
