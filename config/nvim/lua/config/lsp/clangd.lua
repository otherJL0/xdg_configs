return {
  init_options = {
    clangdFileStatus = true,
  },
  on_attach = require("config.lsp").on_attach,
  handlers = require("lsp-status").extensions.clangd.setup(),
  cmd = { "clangd", "--background-index" },
  filetypes = {
    "c",
    "cpp",
    "h",
    "hpp",
    "cc",
  },
  root_dir = require("lspconfig.util").root_pattern(
    "compile_commands.json",
    "CMakeLists.txt",
    "compile_flags.txt",
    ".clangd"
  ),
}
