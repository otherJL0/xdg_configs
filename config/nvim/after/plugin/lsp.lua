local lspconfig = require('lspconfig')
local lsp_status = require('lsp-status')
local nnoremap = vim.keymap.nnoremap
local nvim_command = vim.api.nvim_command

local function on_attach(client)
  vim.lsp.set_log_level(0)
  -- cscope settings
  if vim.fn.has('cscope') == 1 then
    vim.opt.csto = 0
    vim.opt.cscopequickfix = { 's+', 'g+', 'd+', 'c+', 't+', 'e+', 'f+', 'i+', 'a+' }
    vim.opt.cscopetag = true
    vim.opt.cscoperelative = true
    vim.opt.cst = true

    if vim.fn.filereadable('cscope.out') == 1 then
      vim.cmd([[silent cs add cscope.out]])
    end
  end

  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('lsp-status').on_attach(client)

  -- nnoremap { 'K', vim.lsp.buf.hover }
  nnoremap({ 'K', vim.lsp.buf.signature_help })
  nnoremap({ ' ca', vim.lsp.buf.code_action })
  nnoremap({ 'gr', vim.lsp.buf.references })
  nnoremap({ 'gD', vim.lsp.buf.declaration })
  nnoremap({ 'gd', vim.lsp.buf.definition })
  nnoremap({ '[d', vim.lsp.diagnostic.goto_prev })
  nnoremap({ ']d', vim.lsp.diagnostic.goto_next })
  nnoremap({ ' D', vim.lsp.diagnostic.set_loclist })
  nnoremap({ 'gi', vim.lsp.buf.implementation })
  nnoremap({ ' wa', vim.lsp.buf.add_workspace_folder })
  nnoremap({ ' wr', vim.lsp.buf.remove_workspace_folder })
  nnoremap({
    ' wl',
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
  })
  nnoremap({ ' K', vim.lsp.buf.type_definition })
  nnoremap({ ' e', vim.lsp.diagnostic.show_line_diagnostics })
  nnoremap({ ' R', vim.lsp.buf.rename })

  if client.resolved_capabilities.document_highlight then
    nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end

  if client.resolved_capabilities.document_formatting then
    nnoremap({ ' F', vim.lsp.buf.formatting })
    nvim_command([[augroup Format]])
    nvim_command([[autocmd! * <buffer>]])
    nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
    nvim_command([[augroup END]])
  end
end

local function load_config(language_server)
  local language_server_config = 'config.lsp.' .. language_server
  return require(language_server_config)
end

local language_servers = {
  'sorbet',
  'dockerls',
  'tsserver',
  'clangd',
  'cmake',
  'jsonls',
  'bashls',
  'gopls',
  'pyright',
  'sumneko_lua',
}

lsp_status.register_progress()
for _, language_server in ipairs(language_servers) do
  local configs = load_config(language_server)
  lspconfig[language_server].setup(vim.tbl_deep_extend('force', {
    on_attach = on_attach,
    capabilities = vim.tbl_extend('keep', configs.capabilities or {}, lsp_status.capabilities),
  }, configs))
end
