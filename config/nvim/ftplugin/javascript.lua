vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- vim.lsp.start({
--   name = "typescript-language-server",
--   cmd = { "typescript-language-server", "--stdio" },
--   root_dir = vim.fs.dirname(vim.fs.find({ "package.json" }, { upward = true })[1]),
--   on_attach = require("config.lsp.on_attach").on_attach,
-- })
