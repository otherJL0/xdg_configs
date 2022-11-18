local leap = require('leap')

leap.set_default_keymaps()

vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#585b70' })
require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "nvo",
  multiline = false,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}
