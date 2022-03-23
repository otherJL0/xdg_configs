local null_ls = require("null-ls")
return {
  sources = {
    null_ls.builtins.formatting.isort.with({
      command = vim.fn.stdpath("cache") .. "/.venv/bin/isort",
    }),
    null_ls.builtins.formatting.black.with({
      command = vim.fn.stdpath("cache") .. "/.venv/bin/black",
      extra_args = { "--target-version", "py310" },
    }),
    null_ls.builtins.diagnostics.flake8.with({
      command = vim.fn.stdpath("cache") .. "/.venv/bin/flake8",
      extra_args = { "--extend-ignore=E501" },
    }),
    -- null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.diagnostics.hadolint,
    null_ls.builtins.completion.spell.with({
      filetypes = { "md", "norg", "neorg", "markdown" },
    }),
  },
  default_timeout = 20000,

  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
}
