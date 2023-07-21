-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal())
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal())
vim.keymap.set("n", "g<C-a>", require("dial.map").inc_gnormal())
vim.keymap.set("n", "g<C-x>", require("dial.map").dec_gnormal())
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual())
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual())
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual())
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual())
