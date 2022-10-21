local Job = require('plenary.job')

vim.bo.makeprg = 'zig build'

vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = { '*.zig' },
  callback = function()
    local zig_root_dir = vim.fs.dirname(vim.fs.find({ 'build.zig' }, { upward = true })[1])
    vim.lsp.start({
      name = 'zls',
      cmd = { 'zls' },
      root_dir = zig_root_dir,
    })
    vim.api.nvim_buf_create_user_command(0, 'Zig', function(args)
      local message = {}
      Job:new({
        command = 'zig',
        args = { args.args, vim.api.nvim_buf_get_name(0) },
        cwd = zig_root_dir,
        on_stderr = function(_, return_val)
          -- vim.notify("Error")
          -- vim.notify(vim.inspect(j), 4)
          table.insert(message, return_val)
          -- vim.notify(vim.inspect(return_val), 4)
        end,
        on_stdout = function(j, return_val)
          vim.notify('stdout')
          vim.notify(vim.inspect(j))
          vim.notify(vim.inspect(return_val))
        end,
        on_exit = function(j, return_val)
          if return_val == 0 then
            local version = j:result()[1]
            vim.notify(version)
          end
          vim.notify(vim.inspect(message))
        end,
      }):start()
    end, { nargs = 1 })
  end,
})
