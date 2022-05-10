local neorg = require("neorg")
local neorg_callbacks = require("neorg.callbacks")

neorg.setup({
  load = {
    ["core.integrations.telescope"] = {}, -- Enable the telescope module
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader>o",
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          personal = "~/Dropbox/neorg",
          my_workspace = "~/neorg",
          alexandria = vim.fn.stdpath("data") .. "/site/pack/packer/opt/library-of-norgxandria",
        },
      },
    },
  },
})

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {
    n = { -- Bind keys in normal mode
      { "<C-s>", "core.integrations.telescope.find_linkable" },
    },

    i = { -- Bind in insert mode
      { "<C-s>", "core.integrations.telescope.find_linkable" },
      { "<C-f>", "core.integrations.telescope.find_linkable" },
      { "<C-l>", "core.integrations.telescope.insert_link" },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)
