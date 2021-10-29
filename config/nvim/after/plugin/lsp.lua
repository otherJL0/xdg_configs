require("goto-preview").setup({})
local language_servers = {
  "bashls",
  "clangd",
  "cmake",
  "denols",
  "dockerls",
  "gopls",
  "hls",
  "html",
  "jsonls",
  "ocamllsp",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "texlab",
  "yamlls",
}

require("config.lsp").launch(language_servers)

local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.formatting.shellharden,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.hadolint,
}

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup({
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
