local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs") -- Make sure this is a slash (as theres some metamagic happening behind the scenes)
if not lspconfig.teal then
  configs.teal = {
    default_config = {
      cmd = {
        "teal-language-server",
        "logging=on", -- use this to enable logging in /tmp/teal-language-server.log
      },
      filetypes = {
        "teal",
        -- "lua", -- Also works for lua, but you may get type errors that cannot be resolved within lua itself
      },
      root_dir = lspconfig.util.root_pattern("tlconfig.lua", ".git"),
      settings = {},
    },
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
})

vim.lsp.set_log_level(0)
local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- Fancy borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

vim.o.updatetime = 200
-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.notify("Hello test")]])
-- It's good practice to namespace custom handlers to avoid collisions
-- vim.diagnostic.handlers["my/notify"] = {
--   show = function(namespace, bufnr, diagnostics, opts)
--     -- In our example, the opts table has a "log_level" option
--     local level = opts["my/notify"].log_level
--
--     local name = vim.diagnostic.get_namespace(namespace).name
--     local msg = string.format("%d diagnostics in buffer %d from %s", #diagnostics, bufnr, name)
--     vim.notify(msg, level)
--   end,
-- }
--
-- -- Users can configure the handler
-- vim.diagnostic.config({
--   ["my/notify"] = {
--     log_level = vim.log.levels.INFO,
--   },
-- })

vim.cmd([[
  highlight LspDiagnosticsLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight LspDiagnosticsLineNrWarning guibg=#51412A guifg=#FFA500 gui=bold
  highlight LspDiagnosticsLineNrInformation guibg=#1E535D guifg=#00FFFF gui=bold
  highlight LspDiagnosticsLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=LspDiagnosticsSignError linehl= numhl=LspDiagnosticsLineNrError
  sign define DiagnosticSignWarn text= texthl=LspDiagnosticsSignWarning linehl= numhl=LspDiagnosticsLineNrWarning
  sign define DiagnosticSignInfo text= texthl=LspDiagnosticsSignInformation linehl= numhl=LspDiagnosticsLineNrInformation
  sign define DiagnosticSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=LspDiagnosticsLineNrHint
]])

require("goto-preview").setup({})
local language_servers = {
  "bashls",
  "clangd",
  "cmake",
  "denols",
  "dockerls",
  "elmls",
  "gopls",
  "hls",
  "html",
  "jsonls",
  "ocamllsp",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "teal",
  "texlab",
  "yamlls",
}

require("config.lsp").launch(language_servers)

local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.hadolint,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.shellharden,
  null_ls.builtins.formatting.shfmt,
  null_ls.builtins.formatting.stylua,
}

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup({
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})

vim.keymap.nnoremap({
  "<C-k>",
  function()
    vim.diagnostic.open_float(0, { focusable = false, scope = "line", border = "single" })
  end,
})

vim.keymap.nnoremap({
  " k",
  function()
    vim.diagnostic.open_float(0, { focusable = false, scope = "line", border = "single" })
  end,
})
