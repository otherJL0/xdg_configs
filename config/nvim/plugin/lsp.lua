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
local keymap = vim.keymap.set
local saga = require('lspsaga')
--[[ local action = require('lspsaga.action') ]]
saga.init_lsp_saga({
  symbol_in_winbar = {
    enable = true,
    in_custom = true,
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    keymap(
      'n',
      '<leader>cd',
      require('lspsaga.diagnostic').show_line_diagnostics,
      { silent = true, noremap = true }
    )
    keymap(
      'n',
      '<leader>cd',
      '<cmd>Lspsaga show_line_diagnostics<CR>',
      { silent = true, noremap = true }
    )

    -- Diagnsotic jump
    keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', { silent = true })
    keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>', { silent = true })

    -- Only jump to error
    keymap('n', '[E', function()
      require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true })
    keymap('n', ']E', function()
      require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { silent = true })

    vim.lsp.set_log_level('OFF')
    vim.o.updatetime = 200

    local signs = { Error = '', Warn = '', Hint = '', Info = '' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    --[[ local border = { ]]
    --[[   { '┌', 'FloatBorder' }, ]]
    --[[   { '─', 'FloatBorder' }, ]]
    --[[   { '┐', 'FloatBorder' }, ]]
    --[[   { '│', 'FloatBorder' }, ]]
    --[[   { '┘', 'FloatBorder' }, ]]
    --[[   { '─', 'FloatBorder' }, ]]
    --[[   { '└', 'FloatBorder' }, ]]
    --[[   { '│', 'FloatBorder' }, ]]
    --[[ } ]]

    -- Lsp finder find the symbol definition implmement reference
    -- when you use action in finder like open vsplit then your can
    -- use <C-t> to jump back
    keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })

    -- Outline
    keymap('n', '<leader>o', '<cmd>LSoutlineToggle<CR>', { silent = true })

    vim.lsp.handlers['textDocument/publishDiagnostics'] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
      })
    if client.server_capabilities.hoverProvider then
      -- Fancy borders
      --[[ vim.lsp.handlers['textDocument/hover'] = ]]
      --[[ vim.lsp.with(vim.lsp.handlers.hover, { border = border }) ]]
      keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
    end
    if client.server_capabilities.signatureHelpProvider then
      --[[ vim.lsp.handlers['textDocument/signatureHelp'] = ]]
      --[[   vim.lsp.with(vim.lsp.handlers.hover, { border = border }) ]]
      keymap('n', 'gs', '<Cmd>Lspsaga signature_help<CR>', { silent = true, noremap = true })
    end

    if client.server_capabilities.definitionProvider then
      keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { silent = true, noremap = true })
    end

    if client.server_capabilities.implementationProvider then
      keymap('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })
    end

    if client.server_capabilities.declarationProvider then
      keymap('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
    end
    if client.server_capabilities.typeDefinitionProvider then
      keymap('n', ' D', vim.lsp.buf.type_definition, { buffer = args.buf })
    end

    if client.server_capabilities.renameProvider then
      keymap('n', 'grr', '<cmd>Lspsaga rename<CR>', { silent = true, noremap = true })
    end
    if client.server_capabilities.codeActionProvider then
      keymap('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })
      keymap('v', '<leader>ca', '<cmd><C-U>Lspsaga range_code_action<CR>', { silent = true })
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
      vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
      vim.api.nvim_clear_autocmds({ buffer = args.buf, group = 'lsp_document_highlight' })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = 'lsp_document_highlight',
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        group = 'lsp_document_highlight',
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
      vim.cmd([[
        highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
        highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
        highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
        highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

        sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
        sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
        sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
        sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
      ]])
    end

    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, args.buf)
      vim.lsp.handlers['textDocument/documentSymbol'] =
        vim.lsp.with(require('litee.symboltree.handlers').ds_lsp_handler(), {})
    end

    if client.server_capabilities.callHierarchyProvider then
      vim.lsp.handlers['callHierarchy/incomingCalls'] =
        vim.lsp.with(require('litee.calltree.handlers').ch_lsp_handler('from'), {})
      vim.lsp.handlers['callHierarchy/outgoingCalls'] =
        vim.lsp.with(require('litee.calltree.handlers').ch_lsp_handler('to'), {})
    end

    -- if client.server_capabilities.completionProvider then
    --   TODO
    -- end
    --   -- TODO
    --   keymap("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- if client.server_capabilities.referencesProvider then
    --   keymap("n", "", vim.lsp.buf.references, { buffer = args.buf })
    -- end
    -- -- ['textDocument/prepareRename'] = { 'renameProvider', 'prepareProvider' },
    -- -- TODO
    -- -- TODO
    -- if client.server_capabilities.codeLensProvider then
    --   keymap("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- -- ['codeLens/resolve'] = { 'codeLensProvider', 'resolveProvider' },
    -- -- TODO
    -- if client.server_capabilities.executeCommandProvider then
    --   keymap("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- if client.server_capabilities.workspaceSymbolProvider then
    --   -- TODO
    --   keymap("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    -- if client.server_capabilities.documentRangeFormattingProvider then
    --   -- TODO
    --   keymap("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
    --   -- TODO
    --   keymap("n", "", vim.lsp.buf, { buffer = args.buf })
    -- end
  end,
})
