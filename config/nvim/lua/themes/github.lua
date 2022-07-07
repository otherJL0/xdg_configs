require('github-theme').setup({
  -- Set theme variant (options: dark/dimmed/light)
  themeStyle = 'dark',
  -- Highlight style for comments (check :help highlight-args for options)
  commentStyle = 'italic',
  keywordStyle = 'italic',
  functionStyle = 'bold',
  variableStyle = 'bold',
  msgAreaStyle = nil,
  transparent = false,
  hideEndOfBuffer = true,
  hideInactiveStatusline = true,
  sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
  darkSidebar = true, -- Sidebar like windows like NvimTree get a darker background
  darkFloat = true, -- Float windows like the lsp diagnostics windows get a darker background.
})

vim.g.lualine_theme = 'github'
