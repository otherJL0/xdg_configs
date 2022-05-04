local uv = vim.loop

local init_step = 10

local hare_id = uv.new_thread(function(step, ...)
  local ffi = require("ffi")
  -- local hare_uv = vim.loop
  ffi.cdef([[unsigned int usleep(unsigned int seconds);]])
  local sleep = ffi.C.usleep

  while step > 0 do
    step = step - 1
    sleep(math.random(1000))
    print("Hare ran another step")
  end
  print("Hare done running!")
end, init_step, true, "abcd", "false")

local tortoise_id = uv.new_thread(function(step, ...)
  local tortoise_uv = vim.loop
  while step > 0 do
    step = step - 1
    tortoise_uv.sleep(math.random(100))
    print("Tortoise ran another step")
  end
  print("Tortoise done running!")
end, init_step, "dcba", "false")

print(hare_id == hare_id, uv.thread_equal(hare_id, hare_id))
print(tortoise_id == tortoise_id, uv.thread_equal(tortoise_id, tortoise_id))

uv.thread_join(hare_id)
uv.thread_join(tortoise_id)
