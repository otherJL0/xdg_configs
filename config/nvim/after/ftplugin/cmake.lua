vim.lsp.start({
  name = "cmakels",
  cmd = { vim.fn.stdpath("cache") .. "/.venv/bin/cmake-language-server" },
})
