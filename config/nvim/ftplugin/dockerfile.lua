local null_ls = require('null-ls')
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
  sources = {
    diagnostics.hadolint,
  },
  on_init = function(client, _)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.hoverProvider = false
  end,
})
