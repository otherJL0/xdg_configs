local lspconfig = require('lspconfig')

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', ' K', vim.lsp.buf.signature_help)
  vim.keymap.set('n', ' wa', vim.lsp.buf.add_workspace_folder)
  vim.keymap.set('n', ' wr', vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set('n', ' D', vim.lsp.buf.type_definition)
  vim.keymap.set('n', 'grr', vim.lsp.buf.rename)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references)
  vim.keymap.set({ 'n', 'v' }, ' ca', vim.lsp.buf.code_action)
  -- vim.keymap.set("n", " e", vim.diagnostic.show_line_diagnostics )
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', ' q', vim.diagnostic.setloclist)

  -- if client.server_capabilities.code_lens then
  --   vim.notify(vim.inspect(client.server_capabilities))
  -- end

  if client.supports_method('textDocument/documentHighlight') then
    vim.api.nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end

  local client_cmd = vim.split(client.config.cmd[1], '/')
  local server_name = client_cmd[#client_cmd]
  if client.supports_method('textDocument/formatting') and server_name ~= 'lua-language-server' then
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true})' ]])
    -- vim.keymap.set("n", " F", vim.lsp.buf.format)
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.format({async = true})]])
    vim.api.nvim_command([[augroup END]])
  else
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
end

local function load_config(language_server)
  local language_server_config = 'config.lsp.' .. language_server
  if pcall(require, language_server_config) then
    return require(language_server_config)
  end
  return {}
end

require('null-ls').setup(require('config.lsp.null'))

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = {
  'markdown',
  'plaintext',
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

return {
  on_attach = on_attach,
  launch = function(servers)
    for _, language_server in ipairs(servers) do
      local configs = load_config(language_server)
      lspconfig[language_server].setup(vim.tbl_deep_extend('force', {
        on_attach = on_attach,
        capabilities = vim.tbl_extend('keep', configs.capabilities or {}, capabilities),
      }, configs))
    end
  end,

  launch_teal = function()
    require('lspconfig.configs').teal = {
      default_config = {
        cmd = {
          'teal-language-server',
          'logging=on', -- use this to enable logging in /tmp/teal-language-server.log
        },
        filetypes = { 'teal' },
        root_dir = lspconfig.util.root_pattern('tlconfig.lua', '.git'),
        settings = {},
      },
    }
    lspconfig.teal.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  launch_stree = function()
    require('lspconfig.configs').stree = {
      default_config = {
        cmd = { 'stree', 'lsp' },
        filetypes = { 'ruby', 'eruby' },
        root_dir = require('lspconfig.util').root_pattern('.git', 'Gemfile', 'Rakefile'),
      },
    }
    lspconfig.stree.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
