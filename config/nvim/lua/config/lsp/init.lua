local lspconfig = setmetatable({}, {
  __index = function(_, server)
    local config = require(string.format("config.lsp.%s", server))
    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    config.capabilities = capabilities
    config.on_attach = require("config.lsp.on_attach").on_attach
    return config
  end,
})

return lspconfig
