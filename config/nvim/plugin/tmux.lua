local uv = vim.loop
local pipe = uv.new_pipe(true)

pipe:connect("/private/tmp/tmux-501/default")
vim.notify(pipe:getpeername())
pipe:listen(128, function()
  local client = uv.new_pipe(false)
  pipe:accept(client)
  client:write("hello!\n")
  client:close()
end)
