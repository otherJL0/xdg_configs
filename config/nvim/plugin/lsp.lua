-- configure the litee.nvim library
require('litee.lib').setup({})
-- configure litee-calltree.nvim
require('litee.calltree').setup({
  on_open = 'panel',
})
-- configure litee-symboltree.nvim
require('litee.symboltree').setup({
  on_open = 'panel',
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- vim.json.encode(client)
    -- vim.notify(vim.inspect(client.server_capabilities))
    -- vim.notify(vim.inspect(client.name))
    -- vim.notify(vim.inspect(client.config))

    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    end

    if client.server_capabilities.signatureHelpProvider then
      vim.keymap.set('n', ' K', vim.lsp.buf.signature_help, { buffer = args.buf })
    end

    if client.server_capabilities.definitionProvider then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    end

    if client.server_capabilities.implementationProvider then
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })
    end

    if client.server_capabilities.declarationProvider then
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
    end
    if client.server_capabilities.typeDefinitionProvider then
      vim.keymap.set('n', ' D', vim.lsp.buf.type_definition, { buffer = args.buf })
    end

    if client.server_capabilities.renameProvider then
      vim.keymap.set('n', 'grr', vim.lsp.buf.rename, { buffer = args.buf })
    end
    if client.server_capabilities.codeActionProvider then
      vim.keymap.set('n', ' ca', vim.lsp.buf.code_action, { buffer = args.buf })
    end

    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd('BufWritePost', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, async = true })
        end,
      })
    end

    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end

    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, args.buf)
      vim.lsp.handlers['textDocument/documentSymbol'] = vim.lsp.with(
        require('litee.symboltree.handlers').ds_lsp_handler(),
        {}
      )
    end

    if client.server_capabilities.callHierarchyProvider then
      vim.lsp.handlers['callHierarchy/incomingCalls'] = vim.lsp.with(
        require('litee.calltree.handlers').ch_lsp_handler('from'),
        {}
      )
      vim.lsp.handlers['callHierarchy/outgoingCalls'] = vim.lsp.with(
        require('litee.calltree.handlers').ch_lsp_handler('to'),
        {}
      )
    end

    -- if client.server_capabilities.completionProvider then
    --   TODO
    -- end
    --   -- TODO
    --   vim.keymap.set("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- if client.server_capabilities.referencesProvider then
    --   vim.keymap.set("n", "", vim.lsp.buf.references, { buffer = args.buf })
    -- end
    -- -- ['textDocument/prepareRename'] = { 'renameProvider', 'prepareProvider' },
    -- -- TODO
    -- -- TODO
    -- if client.server_capabilities.codeLensProvider then
    --   vim.keymap.set("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- -- ['codeLens/resolve'] = { 'codeLensProvider', 'resolveProvider' },
    -- -- TODO
    -- if client.server_capabilities.executeCommandProvider then
    --   vim.keymap.set("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- if client.server_capabilities.workspaceSymbolProvider then
    --   -- TODO
    --   vim.keymap.set("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- if client.server_capabilities.documentRangeFormattingProvider then
    --   -- TODO
    --   vim.keymap.set("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    --   -- TODO
    --   vim.keymap.set("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
  end,
})
