local uv = vim.loop
local pipe = uv.new_pipe(true)

if vim.env.TMUX then
  local tmux_socket = vim.split(vim.env.TMUX, ",")[1]
  pipe:connect(tmux_socket)
  vim.notify(pipe:getpeername())
  pipe:listen(128, function()
    local client = uv.new_pipe(false)
    pipe:accept(client)
    client:write("hello!\n")
    client:close()
  end)
end
