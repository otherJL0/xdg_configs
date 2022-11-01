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
-- --   standalone = true,
-- --   on_attach = require("config.lsp").on_attach,
-- --   filetypes = { "rust" },
-- --   root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
-- --   settings = {
-- --     ["rust-analyzer"] = {
-- --       assist = {
-- --         exprFillDefault = "todo",
-- --       },
-- --       cachePriming = {
-- --         enable = true,
-- --         numthreads = 0,
-- --       },
-- --       cargo = {
-- --         autoreload = true,
-- --         buildScripts = {
-- --           enable = true,
-- --           useRustcWrapper = true,
-- --         },
-- --         -- features = "all",
-- --         -- features = { "exercises" },
-- --       },
-- --       checkOnSave = {
-- --         enable = true,
-- --         allTargets = true,
-- --         command = "clippy",
-- --       },
-- --       completion = {
-- --         postfix = {
-- --           enable = true,
-- --         },
-- --         autoimport = {
-- --           enable = true,
-- --         },
-- --         autoself = {
-- --           enable = true,
-- --         },
-- --       },
-- --       diagnostics = {
-- --         enable = true,
-- --         enableExperimental = true,
-- --       },
-- --       experimental = {
-- --         procAttrMacros = true,
-- --       },
-- --       files = {
-- --         watcher = "client",
-- --       },
-- --       highlightRelated = {
-- --         breakPoints = true,
-- --         exitPoints = true,
-- --         references = true,
-- --         yieldPoints = true,
-- --       },
-- --       hover = {
-- --         documentation = true,
-- --         links = {
-- --           enable = true,
-- --         },
-- --         actions = {
-- --           enable = true,
-- --           gotoTypeDef = {
-- --             enable = true,
-- --           },
-- --           implementations = {
-- --             enable = true,
-- --           },
-- --           references = {
-- --             enable = true,
-- --           },
-- --           run = {
-- --             enable = true,
-- --           },
-- --           debug = {
-- --             enable = true,
-- --           },
-- --         },
-- --       },
-- --       imports = {
-- --         granularity = {
-- --           enforce = false,
-- --           group = "crate",
-- --         },
-- --         group = {
-- --           enable = true,
-- --         },
-- --         merge = {
-- --           glob = true,
-- --         },
-- --         prefix = "plain",
-- --       },
-- --       inlayHints = {
-- --         enable = true,
-- --         bindingModeHints = {
-- --           enable = true,
-- --         },
-- --         chainingHints = true,
-- --         closingBraceHints = {
-- --           enable = true,
-- --           minLines = 25,
-- --         },
-- --         closureReturnTypeHints = true,
-- --         lifetimeElisionHints = true,
-- --         maxLength = 25,
-- --         parameterHints = true,
-- --         reborrowHints = true,
-- --         renderColons = true,
-- --         typeHints = true,
-- --       },
-- --       joinLines = {
-- --         joinAssignments = true,
-- --         joinElseIf = true,
-- --         removeTrailingComma = true,
-- --         unwrapTrivialBlock = true,
-- --       },
-- --       lens = {
-- --         enable = true,
-- --         debug = true,
-- --         forceCustomCommands = true,
-- --         implementations = true,
-- --         references = true,
-- --         run = true,
-- --       },
-- --       linkedProjects = {},
-- --       lruCapacity = 1024,
-- --       notifications = {
-- --         cargoTomlNotFound = true,
-- --       },
-- --       procMacro = {
-- --         enable = true,
-- --       },
-- --       rustfmt = {
-- --         rangeFormatting = {
-- --           enable = true,
-- --         },
-- --       },
-- --       semanticHighlighting = {
-- --         strings = {
-- --           enable = true,
-- --         },
-- --       },
-- --       signatureInfo = {
-- --         detail = "full",
-- --         documentation = {
-- --           enable = true,
-- --         },
-- --       },
-- --       workspace = {
-- --         symbol = {
-- --           search = {
-- --             kind = "only_types",
-- --             scope = "workspace",
-- --           },
-- --         },
-- --       },
-- --     },
-- --   },
-- -- }
