return {
  cmd = { vim.fn.stdpath('cache') .. '/.venv/bin/cmake-language-server' },
  filetypes = { 'cmake' },
  init_options = { buildDirectory = 'build' },
}
