local M = {}

M.on_attach = function ()
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

return M
