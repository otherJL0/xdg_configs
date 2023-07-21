vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

local get_node_root = function(current_file)
  vim.notify("Checking for node")
  local root_dir =
    vim.fs.dirname(vim.fs.find({ "package.json" }, { path = current_file, upward = true, type = "file" })[1])
  local tsconfig =
    vim.fs.dirname(vim.fs.find({ "tsconfig.json" }, { path = current_file, upward = true, type = "file" })[1])

  vim.notify(vim.inspect(tsconfig))
  if tsconfig ~= nil then
    return root_dir
  end
  return nil
end

local get_deno_root = function(current_file)
  local root_dir = vim.fs.dirname(vim.fs.find({
    "deno.jsonc",
    "deno.json",
    "import_map.json",
    "import-map.json",
  }, { path = current_file, upward = true, type = "file" })[1])
  return root_dir
end

local current_file = vim.api.nvim_buf_get_name(0)
if get_deno_root(current_file) ~= nil then
  vim.lsp.start({
    name = "deno",
    cmd = { "deno", "lsp" },
    on_attach = require("config.lsp.on_attach").on_attach,
    root_dir = vim.fs.dirname(vim.fs.find({ "deno.json", "deno.jsonc" }, { upward = true })[1]),
    init_options = {
      enable = true,
      unstable = true,
    },
    -- settings = {
    --   deno = {
    --     enable = true,
    --     enablePaths = true,
    --   }
    -- },
  })
end

if get_node_root(current_file) ~= nil then
  vim.notify("Inside node project")
  local node_modules = vim.fs.find({ "node_modules" }, { path = current_file, upward = true, type = "directory" })[1]
  vim.lsp.start({
    name = "typescript-language-server",
    cmd = { node_modules .. "/.bin/typescript-language-server", "--stdio" },
    on_attach = require("config.lsp.on_attach").on_attach,
    root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "tsconfig.json" }, { upward = true })[1]),
    -- init_options = {
    --   enable = true,
    --   unstable = true,
    -- },
    -- settings = {
    --   deno = {
    --     enable = true,
    --     enablePaths = true,
    --   }
    -- },
  })
end
