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
    vim.lsp.set_log_level('OFF')
    require('fidget').setup({
      text = {
        spinner = 'dots', -- animation shown when tasks are ongoing
        done = '✔', -- character shown when all tasks are complete
        commenced = 'Started', -- message shown when task starts
        completed = 'Completed', -- message shown when task completes
      },
      align = {
        bottom = true, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
      },
      timer = {
        spinner_rate = 125, -- frame rate of spinner animation, in ms
        fidget_decay = 2000, -- how long to keep around empty fidget, in ms
        task_decay = 1000, -- how long to keep around completed task, in ms
      },
      window = {
        relative = 'win', -- where to anchor, either "win" or "editor"
        blend = 100, -- &winblend for the window
        zindex = nil, -- the zindex value for the window
      },
      fmt = {
        leftpad = true, -- right-justify text in fidget box
        stack_upwards = true, -- list of tasks grows upwards
        max_width = 0, -- maximum width of the fidget box
        fidget = function(fidget_name, spinner) -- function to format fidget titlefunction(fidget_name, spinner)
          return string.format('%s %s', spinner, fidget_name)
        end,
        task = function(task_name, message, percentage) -- function to format each task linefunction(task_name, message, percentage)
          return string.format(
            '%s%s [%s]',
            message,
            percentage and string.format(' (%s%%)', percentage) or '',
            task_name
          )
        end,
      },
      debug = {
        logging = false, -- whether to enable logging, for debugging
      },
    })

    vim.o.updatetime = 200

    local signs = { Error = '', Warn = '', Hint = '', Info = '' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local border = {
      { '┌', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '┐', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '┘', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '└', 'FloatBorder' },
      { '│', 'FloatBorder' },
    }

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
      }
    )
    if client.server_capabilities.hoverProvider then
      -- Fancy borders
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = border }
      )
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    end
    if client.server_capabilities.signatureHelpProvider then
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = border }
      )
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
