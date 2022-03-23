local lsp_status = require("lsp-status")
local lspconfig = require("lspconfig")

require("null-ls").setup(require("config.lsp.null"))

local function on_attach(client, bufnr)
  lsp_status.on_attach(client)
  require("fidget").setup({
    text = {
      spinner = "dots", -- animation shown when tasks are ongoing
      done = "✔", -- character shown when all tasks are complete
      commenced = "Started", -- message shown when task starts
      completed = "Completed", -- message shown when task completes
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
      relative = "win", -- where to anchor, either "win" or "editor"
      blend = 100, -- &winblend for the window
      zindex = nil, -- the zindex value for the window
    },
    fmt = {
      leftpad = true, -- right-justify text in fidget box
      stack_upwards = true, -- list of tasks grows upwards
      max_width = 0, -- maximum width of the fidget box
      fidget = function(fidget_name, spinner) -- function to format fidget titlefunction(fidget_name, spinner)
        return string.format("%s %s", spinner, fidget_name)
      end,
      task = function(task_name, message, percentage) -- function to format each task linefunction(task_name, message, percentage)
        return string.format("%s%s [%s]", message, percentage and string.format(" (%s%%)", percentage) or "", task_name)
      end,
    },
    debug = {
      logging = false, -- whether to enable logging, for debugging
    },
  })
  require("lsp_signature").on_attach({
    bind = true,
    handler_opts = {
      border = "double", -- double, rounded, single, shadow, none
    },
    extra_trigger_chars = { "(", "," },
    toggle_key = "<C-x>",
  }) -- Note: add in lsp client on-attach

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.keymap.set("n", "gpd", require("goto-preview").goto_preview_definition)
  vim.keymap.set("n", "gpi", require("goto-preview").goto_preview_implementation)
  vim.keymap.set("n", "gP", require("goto-preview").close_all_win)
  -- Only set if you have telescope installed
  vim.keymap.set("n", "gpr", require("goto-preview").goto_preview_references)

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
  vim.keymap.set("n", " K", vim.lsp.buf.signature_help)
  vim.keymap.set("n", " wa", vim.lsp.buf.add_workspace_folder)
  vim.keymap.set("n", " wr", vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set("n", " D", vim.lsp.buf.type_definition)
  vim.keymap.set("n", "grr", vim.lsp.buf.rename)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set("n", " ca", vim.lsp.buf.code_action)
  vim.keymap.set("v", " ca", vim.lsp.buf.range_code_action)
  -- vim.keymap.set("n", " e", vim.diagnostic.show_line_diagnostics )
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", " q", vim.diagnostic.setloclist)

  -- if client.resolved_capabilities.code_lens then
  --   vim.notify(vim.inspect(client.resolved_capabilities))
  -- end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end

  client_cmd = vim.split(client.config.cmd[1], "/")
  server_name = client_cmd[#client_cmd]
  if client.resolved_capabilities.document_formatting and server_name ~= "lua-language-server" then
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
    vim.keymap.set("n", " F", vim.lsp.buf.formatting)
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
    vim.api.nvim_command([[augroup END]])
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

local function load_config(language_server)
  local language_server_config = "config.lsp." .. language_server
  if pcall(require, language_server_config) then
    return require(language_server_config)
  end
  return {}
end

-- local language_servers = {
--   "bashls",
--   "clangd",
--   "clangd",
--   "cmake",
--   "denols",
--   "dockerls",
--   "gopls",
--   "html",
--   "jsonls",
--   "ocamllsp",
--   "pyright",
--   "rust_analyzer",
--   "sumneko_lua",
--   "texlab",
--   "yamlls",
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities)

lsp_status.register_progress()
return {
  on_attach = on_attach,
  launch = function(servers)
    for _, language_server in ipairs(servers) do
      local configs = load_config(language_server)
      lspconfig[language_server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = vim.tbl_extend("keep", configs.capabilities or {}, capabilities),
      }, configs))
    end
  end,

  launch_teal = function()
    require("lspconfig.configs").teal = {
      default_config = {
        cmd = {
          "teal-language-server",
          "logging=on", -- use this to enable logging in /tmp/teal-language-server.log
        },
        filetypes = { "teal" },
        root_dir = lspconfig.util.root_pattern("tlconfig.lua", ".git"),
        settings = {},
      },
    }
    lspconfig.teal.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
