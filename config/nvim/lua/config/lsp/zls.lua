return {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root_dir = require('lspconfig.util').root_pattern('zls.json', '.git', 'build.zig'),
  single_file_support = true,
}
