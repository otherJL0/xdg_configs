-- Quickly enter command mode
vim.keymap.set('n', '  c', ':')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Hacky ctrl-a ctrl-c
vim.keymap.set('n', 'ya%', "mzggy99999y'z")
vim.keymap.set('n', 'da%', 'ggd99999d')

-- Wild menu
vim.opt.wildignore = vim.opt.wildignore + { '__pycache__', '*.o', '*~', '*.pyc', '*pycache*' }
vim.opt.pumblend = 17
vim.opt.wildmode = { 'longest', 'full' }
vim.opt.wildoptions = 'pum'

-- Colorful
vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.indentexpr = ''
vim.opt.wrap = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Highlight current line and line number
vim.opt.cursorlineopt = 'both'
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.swapfile = false -- No swap files
vim.opt.splitbelow = true -- New splits open below
vim.opt.splitright = true --New vsplits open right
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Except when explicitly adding uppercase
-- opt.showtabline = 2 -- Always show tabline
vim.opt.mouse = 'n' -- Only allow mouse in normal mode
vim.opt.scrolloff = 10 -- At least 10 lines should show past current line
vim.opt.showmode = false -- Do not show mode in cmd line
vim.opt.redrawtime = 90000
vim.opt.inccommand = 'nosplit' -- Highlight search/replace queries
vim.opt.showmatch = true -- Show matching bracket character when hovering
vim.opt.hidden = true -- Keep buffers around

vim.opt.cmdheight = 0
-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.clipboard = 'unnamedplus'

vim.opt.formatoptions = vim.opt.formatoptions
  - 'a' -- Auto formatting is BAD.
  - 't' -- Don't auto format my code. I got linters for that.
  + 'c' -- In general, I like it when comments respect textwidth
  + 'q' -- Allow formatting comments w/ gq
  - 'o' -- O and o, don't continue comments
  + 'r' -- But do continue when pressing enter.
  + 'n' -- Indent past the formatlistpat, not underneath it.
  + 'j' -- Auto-remove comments if possible.
  - '2' -- I'm not in gradeschool anymore

-- set joinspaces
vim.opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
vim.opt.fillchars = { eob = '~' }

vim.opt.list = true
vim.opt.listchars:append('space:⋅')
vim.opt.listchars:append('eol:↴')
vim.opt.colorcolumn = '100'

vim.cmd([[au BufRead,BufNewFile,BufEnter * lua vim.opt.formatoptions:remove({"c", "r", "o"})]])

vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  callback = function()
    local ignored_filetypes = {
      'help',
    }

    local ignored_prefix = {
      'Neogit',
      'Diffview',
      'NvimTree',
      'tsplayground',
      'Telescope',
      'dap',
      'packer',
      'Outline',
      'Trouble',
      'symboltree',
      'calltree',
    }
    for _, prefix in ipairs(ignored_prefix) do
      if string.find(vim.bo.filetype, prefix) then
        return
      end
    end
    if vim.tbl_contains(ignored_filetypes, vim.bo.filetype) then
      return
    end
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true
    vim.wo.relativenumber = true
    vim.wo.colorcolumn = '100'
    vim.wo.signcolumn = 'yes:3' -- Always show a sign column
  end,
})

vim.api.nvim_create_autocmd('WinLeave', {
  pattern = '*',
  callback = function()
    if vim.bo.modifiable then
      vim.wo.cursorline = false
      vim.wo.cursorcolumn = false
      vim.wo.relativenumber = false
      vim.wo.colorcolumn = ''
      vim.wo.signcolumn = 'no'
    end
  end,
})

vim.opt.grepprg = 'rg'

vim.keymap.set('n', [[  "]], ':split<CR>')
vim.keymap.set('n', [[  %]], ':vsplit<CR>')

vim.keymap.set('c', '<C-A>', '<Home>')
vim.keymap.set('c', '<C-B>', '<Left>')
vim.keymap.set('c', '<C-D>', '<Del>')
vim.keymap.set('c', '<C-E>', '<End>')
vim.keymap.set('c', '<C-F>', '<Right>')
vim.keymap.set('c', '<C-N>', '<Down>')
vim.keymap.set('c', '<C-P>', '<Up>')
-- vim.keymap.set("c", "<A-B>", "<S-Left>")
-- vim.keymap.set("c", "<A-F>", "<S-Right>")

vim.api.nvim_create_autocmd('RecordingEnter', {
  pattern = '*',
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd('RecordingLeave', {
  pattern = '*',
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
