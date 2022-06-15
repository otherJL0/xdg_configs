-- local function determine_venv_path()
--   local cwd = vim.fn.getcwd()
--   local candidate_path
--   for _, venv in ipairs({ "venv", ".venv", "env" }) do
--     candidate_path = string.format("%s/%s/bin/python", cwd, venv)
--     if vim.fn.executable(candidate_path) == 1 then
--       return venv
--     end
--   end
--   return vim.env.HOME .. "/.asdf/shims/python3"
-- end

vim.lsp.start({
  name = "pyright",
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/" .. "pyright-langserver", "--stdio" },
  root_dir = vim.fs.dirname(vim.fs.find({
    "env",
    ".venv/",
    "pyproject.toml",
    "pyright.json",
    "setup.cfg",
    "setup.py",
    "requirements.txt",
    "Pipfile",
  }, { upward = true })[1]),
})
