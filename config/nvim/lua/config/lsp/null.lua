local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

return {
  sources = {

    -- Fromatting
    formatting.isort.with({
      command = vim.fn.stdpath("cache") .. "/.venv/bin/isort",
    }),
    formatting.black.with({
      command = vim.fn.stdpath("cache") .. "/.venv/bin/black",
      extra_args = { "--target-version", "py310" },
    }),
    formatting.stylua,
    -- formatting.shfmt,
    formatting.fish_indent,

    -- Diagnostics
    diagnostics.flake8.with({
      command = vim.fn.stdpath("cache") .. "/.venv/bin/flake8",
      extra_args = { "--extend-ignore=E501" },
    }),
    diagnostics.shellcheck,
    -- null_ls.builtins.diagnostics.mypy,
    diagnostics.hadolint,

    completion.spell.with({
      filetypes = { "md", "norg", "neorg", "markdown" },
    }),

    -- Code Actions
    -- code_actions.gitsigns,
    code_actions.shellcheck,
  },
  default_timeout = 20000,

  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = vim.lsp.buf.formatting_sync,
      })
    end
  end,
}
