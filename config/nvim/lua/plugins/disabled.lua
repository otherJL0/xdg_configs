return vim.tbl_map(function(plugin)
  return { plugin, enabled = false }
end, {
  "echasnovski/mini.indentscope",
  "nvim-neo-tree/neo-tree.nvim",
  "nvim-pack/nvim-spectre",
})
