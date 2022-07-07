local Job = require('plenary.job')

vim.api.nvim_create_user_command('NpmInstall', function(cmd_tbl)
  local package = cmd_tbl.args
  vim.notify('npm install ' .. package)

  Job
    :new({
      command = 'npm',
      args = { 'install', package },
      cwd = vim.fn.stdpath('cache'),
      on_exit = function(j, return_val)
        if return_val == 0 then
          local version = j:result()[1]
          vim.notify(version)
        end
      end,
    })
    :start()
end, { nargs = 1 })
