if not pcall(require, "packer") then
    require("config.setup").install_packer()
end
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
vim.g.mapleader = " "
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
vim.g.minor_mode = ""

require("impatient").enable_profile()
vim.notify = require("notify")
require("config.packer")

require("themes.catppuccin")

vim.g.python3_host_prog = vim.fn.stdpath("cache") .. "/.venv/bin/python3"
