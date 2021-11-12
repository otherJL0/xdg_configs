local dap = require("dap")
local ui = require("dapui")
local nnoremap = vim.keymap.nnoremap

dap.set_log_level("TRACE")

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},

    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implicatons:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
}

dap.configurations.c = dap.configurations.cpp

dap.adapters.go = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = { nil, stdout },
    args = { "dap", "-l", "127.0.0.1:" .. port },
    detached = true,
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        require("dap.repl").append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(function()
    callback({ type = "server", host = "127.0.0.1", port = port })
  end, 100)
end
-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "go",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  -- works with go.mod packages and sub packages
  {
    type = "go",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}

dap.adapters.python = {
  type = "executable",
  command = "py",
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    -- program = "/Users/jlopez/caboodle/wf/load_and_electric_generation/scripts/wf_listing.py", -- This configuration will launch the current file if used.
    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
      elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
      elseif vim.fn.executable(vim.env.CONDA_PYTHON_EXE) == 1 then
        return vim.env.CONDA_PYTHON_EXE
      else
        return vim.env.HOME .. "/.asdf/shims/python3"
      end
    end,
  },
}

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input("Host [127.0.0.1]: ")
      if value ~= "" then
        return value
      end
      return "127.0.0.1"
    end,
    port = function()
      local val = tonumber(vim.fn.input("Port: "))
      assert(val, "Please provide a port number")
      return val
    end,
  },
}

dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host, port = config.port })
end

ui.setup()

nnoremap({ "<F8>", dap.toggle_breakpoint })
nnoremap({ "  bp", dap.toggle_breakpoint })
nnoremap({ "<F9>", dap.continue })
nnoremap({ "  c", dap.continue })
nnoremap({ "<F7>", dap.reverse_continue })
nnoremap({ "<F4>", ui.toggle })
nnoremap({ "<F2>", dap.step_over })
nnoremap({ "<F1>", dap.step_into })
