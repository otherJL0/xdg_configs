if not pcall(require, "packer") then
  require("config.setup").install_packer()
else
  vim.g.mapleader = " "
  vim.g.did_load_filetypes = 0
  vim.g.do_filetype_lua = 1
  vim.g.minor_mode = ""

  require("fun")()

  require("impatient").enable_profile()
  vim.notify = require("notify")
  require("config.packer")
  require("config.globals")

  -- vim.cmd("runtime plugin/astronauta.vim")

  require("themes.catppuccin")
  require("config.minor_modes")

  function P(element)
    print(vim.inspect(element))
  end

  function PN(element)
    vim.notify(vim.inspect(element))
  end

  vim.api.nvim_add_user_command("Inspect", function(element)
    vim.notify(vim.inspect(element))
  end, { nargs = 1 })

  vim.keymap.set("n", " <C-l>", vim.diagnostic.hide)
end
