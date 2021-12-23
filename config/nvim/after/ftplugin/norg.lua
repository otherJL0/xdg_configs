require("neorg").setup({
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.integrations.telescope"] = {}, -- Enable the telescope module
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
      config = {
        workspaces = {
          my_workspace = "~/neorg",
        },
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.keybinds"] = { -- Configure core.keybinds
      config = {
        default_keybinds = true, -- Generate the default keybinds
        neorg_leader = " o", -- This is the default if unspecified
      },
    },
  },
  logger = {
    -- Should print the output to neovim while running
    use_console = false,

    -- Should highlighting be used in console (using echohl)
    highlights = true,

    -- Should write to a file
    use_file = true,

    -- Any messages above this level will be logged.
    level = "trace",

    -- Level configuration
    modes = {
      { name = "trace", hl = "Comment" },
      { name = "debug", hl = "Comment" },
      { name = "info", hl = "None" },
      { name = "warn", hl = "WarningMsg" },
      { name = "error", hl = "ErrorMsg" },
      { name = "fatal", hl = "ErrorMsg" },
    },

    -- Can limit the number of decimals displayed for floats
    float_precision = 0.01,
  },
})
