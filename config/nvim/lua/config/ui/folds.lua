vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)

require("ufo").setup({
  preview = {
    win_config = {
      border = "none",
      winhighlight = "Normal:NoicePopup",
    },
  },
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
})
