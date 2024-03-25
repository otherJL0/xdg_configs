return vim.tbl_map(function(plugin)
  return { plugin, enabled = false }
end, {
  "folke/tokyonight.nvim",
  "stevearc/conform.nvim",
})
