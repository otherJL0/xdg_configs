return {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascript.jsx", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
    disableAutomaticTypingAcquisition = false,
  },
}
