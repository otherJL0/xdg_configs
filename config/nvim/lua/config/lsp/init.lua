local lspconfig = setmetatable({}, {
  __index = function(_, server)
    local config = require(string.format("config.lsp.%s", server))
    -- nvim-cmp supports additional completion capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    config.root_dir = vim.fs.dirname(vim.fs.find(config.root_dir, { upward = true })[1])

    config.capabilities = capabilities
    config.on_attach = require("config.lsp.on_attach").on_attach
    return function()
      vim.lsp.start(config)
    end
  end,
})

return lspconfig
