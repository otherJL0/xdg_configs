require('neotest').setup({
  adapters = {
    require('neotest-rust'),
  },
})

vim.lsp.start({
  name = 'rust-analyzer',
  cmd = { 'rust-analyzer' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'Cargo.toml', 'build.rs' }, { upward = true })[1]),
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        enable = true,
        command = 'clippy',
      },
      completion = {
        privateEditable = {
          enable = true,
        },
      },
      diagnostics = {
        experimental = {
          enable = true,
        },
      },
      hover = {
        actions = {
          enable = true,
          references = {
            enable = true,
          },
        },
      },
      inlayHints = {
        typeHints = {
          enable = true,
        },
        bindingModeHints = {
          enable = true,
        },
        closureReturnTypeHints = {
          enable = 'always',
        },
        lifetimeElisionHints = {
          enable = 'always',
          useParameterNames = true,
        },
        reborrowHints = {
          enable = 'always',
        },
      },
      lens = {
        enable = true,
        references = {
          adt = {
            enable = true,
          },
          enumVariant = {
            enable = true,
          },
          method = {
            enable = true,
          },
          trait = {
            enable = true,
          },
        },
      },
      rustfmt = {
        rangeFormatting = {
          enable = true,
        },
      },
      semanticHighlighting = {
        operator = {
          specialization = {
            enable = true,
          },
        },
        punctuation = {
          enable = true,
          separate = {
            macro = {
              bang = true,
            },
          },
          specialization = {
            enable = true,
          },
        },
      },
    },
  },
})
