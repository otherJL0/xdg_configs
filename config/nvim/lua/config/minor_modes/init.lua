local define_minor_mode = require("minor-mode").define_minor_mode

define_minor_mode(
  "lisp",
  [[
  Minor modes for lisps to navigate sexps. Replaces some normal movement
  keybindings.
  ]],
  {
    command = "LispMode",
    keymap = {
      {
        "n",
        "j",
        function()
          vim.fn.search("(")
        end,
        { silent = true },
      },

      {
        "n",
        "k",
        function()
          vim.fn.search("(", "b")
        end,
        { silent = true },
      },
    },
  }
)
