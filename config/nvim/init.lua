vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.g.mapleader = " "

-- Highlight current line and line number
vim.opt.cursorlineopt = "both"
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.swapfile = false -- No swap files
vim.opt.splitbelow = true -- New splits open below
vim.opt.splitright = true --New vsplits open right
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Except when explicitly adding uppercase

vim.opt.inccommand = "nosplit" -- Highlight search/replace queries
vim.opt.showmatch = true -- Show matching bracket character when hovering
vim.opt.signcolumn = "yes:2" -- Always show a sign column

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.keymap.set("n", [[  "]], ":split<CR>")
vim.keymap.set("n", [[  %]], ":vsplit<CR>")

vim.keymap.set({ "i", "c" }, "<C-B>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-F>", "<Right>")
vim.keymap.set({ "i", "c" }, "<C-D>", "<Del>")
vim.keymap.set({ "i", "c" }, "<C-P>", "<Up>")
vim.keymap.set({ "i", "c" }, "<C-N>", "<Down>")
vim.keymap.set({ "i", "c" }, "<C-A>", "<Home>")
vim.keymap.set({ "i", "c" }, "<C-E>", "<End>")
vim.keymap.set({ "i", "c" }, "<A-b>", "<S-Left>")
vim.keymap.set({ "i", "c" }, "<A-f>", "<S-Right>")
vim.keymap.set({ "i", "c" }, "<A-x>", "<Esc>:")
vim.keymap.set({ "i", "c" }, "<A-f>", "<Esc>")
vim.keymap.set({ "i", "c" }, "<A-f>", "<S-Right>")
vim.keymap.set({ "i", "c" }, "<A-f>", "<S-Right>")

--
--


vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

require("plugins")
vim.notify = require("notify")
require("config.treesitter")
require("config.colorscheme")

require("config.ui")
