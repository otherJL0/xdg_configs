vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildignore = '__pycache__'
vim.opt.wildignore = vim.opt.wildignore + { '*.o', '*~', '*.pyc', '*pycache*' }
vim.opt.wildmode = { 'longest', 'list', 'full' }
vim.opt.pumblend = 17
vim.opt.wildmode = vim.opt.wildmode - 'list'
vim.opt.wildmode = vim.opt.wildmode + { 'longest', 'full' }
vim.opt.wildoptions = 'pum'
vim.opt.cmdheight = 1 -- Height of the command bar
vim.opt.incsearch = true -- Makes search act like search in modern browsers
vim.opt.showmatch = true -- show matching brackets when text indicator is over them
vim.opt.relativenumber = true -- Show line numbers
vim.opt.number = true -- But show the actual number for the line we're on
vim.opt.ignorecase = true -- Ignore case when searching...
vim.opt.smartcase = true -- ... unless there is a capital letter in the query
vim.opt.hidden = true -- I like having buffers stay around
vim.opt.equalalways = true -- I don't like my windows changing all the time
vim.opt.splitright = true -- Prefer windows splitting to the right
vim.opt.splitbelow = true -- Prefer windows splitting to the bottom
vim.opt.updatetime = 1000 -- Make updates happen faster
vim.opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
vim.opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true
vim.opt.signcolumn = 'yes'
vim.opt.foldmethod = 'marker'
vim.opt.foldlevel = 0
vim.opt.modelines = 1
vim.opt.belloff = 'all' -- Just turn the dang bell off
vim.opt.clipboard = 'unnamedplus'
vim.opt.inccommand = 'nosplit'
vim.opt.swapfile = false -- Living on the edge
vim.opt.shada = { '!', "'1000", '<50', 's10', 'h' }
vim.opt.mouse = 'n'
vim.opt.formatoptions = vim.opt.formatoptions
vim.opt.joinspaces = false -- Two spaces and grade school, we're done
vim.opt.fillchars = { eob = '~' }
