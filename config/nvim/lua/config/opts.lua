local opt = vim.opt

-- Wild menu
opt.wildignore = opt.wildignore + { "__pycache__", "*.o", "*~", "*.pyc", "*pycache*" }
opt.pumblend = 17
opt.wildmode = opt.wildmode + { "longest", "full" }
opt.wildoptions = "pum"

-- Colorful
opt.termguicolors = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.indentexpr = ""
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Highlight current line and line number
opt.cursorlineopt = "both"
opt.cursorline = true

opt.swapfile = false -- No swap files
opt.splitbelow = true -- New splits open below
opt.splitright = true --New vsplits open right
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Except when explicitly adding uppercase
opt.signcolumn = "yes" -- Always show a sign column
opt.showtabline = 2 -- Always show tabline
opt.mouse = "n" -- Only allow mouse in normal mode
opt.scrolloff = 10 -- At least 10 lines should show past current line
opt.showmode = false -- Do not show mode in cmd line
opt.inccommand = "nosplit" -- Highlight search/replace queries
opt.cmdheight = 1 -- Cmd height
opt.showmatch = true -- Show matching bracket character when hovering
opt.hidden = true -- Keep buffers around

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

opt.clipboard = "unnamedplus"

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }
