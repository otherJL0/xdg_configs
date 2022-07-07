local Job = require('plenary.job')

local zls_dir = vim.fn.stdpath('cache') .. '/zls'

local zls_clone = Job:new({
  command = 'git',
  args = { 'clone', '--recurse-submodules', 'https://github.com/zigtools/zls.git', zls_dir },
  cwd = vim.fn.stdpath('cache'),
  on_exit = function(j, return_val)
    vim.notify(vim.inspect(j:result()))
    vim.notify(vim.inspect(return_val))
  end,
})

local zls_pull = Job:new({
  command = 'git',
  args = { 'pull' },
  cwd = zls_dir,
  on_exit = function(j, return_val)
    vim.notify(vim.inspect(j:result()))
    vim.notify(vim.inspect(return_val))
  end,
})

local zls_submodule_update = Job:new({
  command = 'git',
  args = { 'submodule', 'update', '--init', '--recursive' },
  cwd = zls_dir,
  on_exit = function(j, return_val)
    vim.notify(vim.inspect(j:result()))
    vim.notify(vim.inspect(return_val))
  end,
})

local zls_build = Job:new({
  command = 'zig',
  args = { 'build', '-Drelease-safe', '-Ddata_version=master' },
  cwd = zls_dir,
  on_exit = function(j, return_val)
    vim.notify(vim.inspect(j:result()))
    vim.notify(vim.inspect(return_val))
  end,
})

vim.api.nvim_create_user_command('ZlsInstall', function()
  zls_clone:sync()
  zls_build:sync(60000, 0)
end, {})

vim.api.nvim_create_user_command('ZlsUpdate', function()
  zls_pull:sync()
  zls_submodule_update:sync()
  zls_build:sync(60000, 0)
end, {})
