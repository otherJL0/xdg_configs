local function get_clangd_cmd()
  if vim.fn.executable("clangd") == 1 then
    return "clangd"
  end

  -- Iterate backwards over latest clangd versions
  for version = 15, 1, -1 do
    local clangd_cmd = string.format("clangd-%d", version)
    if vim.fn.executable(clangd_cmd) == 1 then
      return clangd_cmd
    end
  end

  return ""
end

return {
  init_options = {
    clangdFileStatus = true,
  },
  handlers = require("lsp-status").extensions.clangd.setup(),
  cmd = { get_clangd_cmd(), "--background-index" },
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
