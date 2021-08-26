local M = {}

function M.install_packer()
  local prompt = vim.fn.input("No packer installation detected. Install packer now? (y/N)")
  if prompt ~= "y" then
    vim.cmd("quitall!")
  end
  vim.notify("installing packer...")
end

return M
