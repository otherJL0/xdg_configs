local M = {}
local current_file = vim.api.nvim_buf_get_name(0)
local venv =
  vim.fs.find({ "env", ".venv", "venv", ".env" }, { path = current_file, upward = true, type = "directory" })[1]

M.name = "pyright"
M.cmd = { "pyright-langserver", "--stdio" }
M.root_dir = { "requirements.txt", "pyproject.toml", "setup.cfg", "setup.py" }

M.settings = {
}

if venv then
  M.settings.python.pythonPath = venv .. "/bin/python"
  vim.env.VIRTUAL_ENV = venv
end

return M
