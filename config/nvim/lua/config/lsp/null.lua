local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    'textDocument/formatting',
    { textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
    function(err, res)
      if err then
        local err_msg = type(err) == 'string' and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify('formatting: ' .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      if
        not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, 'modified')
      then
        return
      end

      if res then
        vim.lsp.util.apply_text_edits(res, bufnr, vim.bo.fileencoding)
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd('silent noautocmd update')
        end)
      end
    end
  )
end

return {
  sources = {

    -- Fromatting
    formatting.isort.with({
      command = vim.fn.stdpath('cache') .. '/.venv/bin/isort',
    }),
    formatting.black.with({
      command = vim.fn.stdpath('cache') .. '/.venv/bin/black',
      extra_args = { '--target-version', 'py310' },
    }),
    formatting.stylua,
    -- formatting.shfmt,
    formatting.fish_indent,

    -- Diagnostics
    diagnostics.flake8.with({
      command = vim.fn.stdpath('cache') .. '/.venv/bin/flake8',
      extra_args = { '--extend-ignore=E501' },
    }),
    diagnostics.shellcheck,
    -- null_ls.builtins.diagnostics.mypy,
    diagnostics.hadolint,

    completion.spell.with({
      filetypes = { 'md', 'norg', 'neorg', 'markdown' },
    }),

    -- Code Actions
    -- code_actions.gitsigns,
    code_actions.shellcheck,
  },
  default_timeout = 20000,

  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePost', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          async_formatting(bufnr)
        end,
      })
    end
  end,
}
