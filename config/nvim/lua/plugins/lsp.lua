return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        pyright = {
          -- settings = {
          --   pyright = { disableOrganizeImports = false },
          --   python = { analysis = { ignore = { "*" } } },
          -- },
        },
        ruff_lsp = {
          -- init_options = {
          --   settings = {
          --     -- format = { args = { "--line-length=88" } },
          --     lint = { args = { "--line-length=88" } },
          --   },
          -- },
        },
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "ruff_lsp" then
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
}
