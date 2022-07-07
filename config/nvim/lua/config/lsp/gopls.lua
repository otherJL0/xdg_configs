return {
  cmd = { 'gopls', '--remote=auto' },
  filetypes = { 'go', 'gomod' },
  root_dir = require('lspconfig.util').root_pattern('go.mod', '.git'),
  capabilities = {
    textDocument = { completion = { completionItem = { snippetSupport = true } } },
  },
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = true,
        generate = true,
        regenerate_cgo = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      semanticTokens = true,
      usePlaceholders = true,
      matcher = 'CaseSensitive',
      analyses = {
        fieldalignment = true,
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },

      staticcheck = true,
      annotations = { bounds = true, escape = true, inline = true },
      hoverKind = 'Structured',
      linkTarget = 'pkg.go.dev',
      linksInHover = true,
      importShortcut = 'Both',
      symbolMatcher = 'CaseSensitive',
      symbolStyle = 'Dynamic',
    },
  },
}
