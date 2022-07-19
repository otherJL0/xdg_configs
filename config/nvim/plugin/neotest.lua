vim.api.nvim_create_user_command('Test', function()
  require('neotest').run.run()
end, {})

vim.api.nvim_create_user_command('TestFile', function()
  require('neotest').run.run(vim.fn.expand('%'))
end, {})

vim.api.nvim_create_user_command('TestAll', function()
  require('neotest').run.run(vim.fn.expand('%'))
end, {})
