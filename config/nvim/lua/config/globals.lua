--# selene: allow(unscoped_variables,unused_variable)
P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

function P(element)
  print(vim.inspect(element))
end

function PN(element)
  vim.notify(vim.inspect(element))
end

vim.api.nvim_add_user_command("Inspect", function(element)
  vim.notify(vim.inspect(element))
end, { nargs = 1 })

vim.g.custom_hide_diagnostic = true
local function diagnostic_toggle()
  if vim.tbl_isempty(vim.diagnostic.get(0)) then
    return
  end

  vim.g.custom_hide_diagnostic = not vim.g.custom_hide_diagnostic

  if vim.g.custom_hide_diagnostic then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end
vim.api.nvim_add_user_command("DiagnosticShow", "lua vim.diagnostic.show()", {})
vim.api.nvim_add_user_command("DiagnosticHide", "lua vim.diagnostic.hide()", {})
vim.api.nvim_add_user_command("DiagnosticToggle", diagnostic_toggle, {})
vim.keymap.set("n", " <C-l>", diagnostic_toggle)

vim.api.nvim_add_user_command("AutoFormatEnable", function()
  vim.cmd("autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
end, {})
vim.api.nvim_add_user_command("AutoFormatDisable", function()
  vim.cmd("autocmd! BufWrite")
end, {})
-- vim.api.nvim_add_user_command("FormatDisable")
