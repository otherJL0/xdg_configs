return {
  cmd = { "rust-analyzer" },
  on_attach = require("config.lsp").on_attach,
  filetypes = { "rust" },
  root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      assist = {
        exprFillDefault = "todo",
      },
      cachePriming = {
        enable = true,
        numthreads = 0,
      },
      cargo = {
        autoreload = true,
        buildScripts = {
          enable = true,
          useRustcWrapper = true,
        },
      },
      checkOnSave = {
        enable = true,
        allTargets = true,
        command = "check",
      },
      completion = {
        postfix = {
          enable = true,
        },
        autoimport = {
          enable = true,
        },
        autoself = {
          enable = true,
        },
      },
      diagnostics = {
        enable = true,
        enableExperimental = true,
      },
      experimental = {
        procAttrMacros = true,
      },
      files = {
        watcher = "client",
      },
      highlightRelated = {
        breakPoints = {
          enable = true,
        },
        exitPoints = {
          enable = true,
        },
        references = {
          enable = true,
        },
        yieldPoints = {
          enable = true,
        },
      },
      hover = {
        documentation = {
          enable = true,
        },
        links = {
          enable = true,
        },
        actions = {
          enable = true,
          gotoTypeDef = {
            enable = true,
          },
          implementations = {
            enable = true,
          },
          references = {
            enable = true,
          },
          run = {
            enable = true,
          },
          debug = {
            enable = true,
          },
        },
      },
      imports = {
        granularity = {
          enforce = false,
          group = "crate",
        },
        group = {
          enable = true,
        },
        merge = {
          glob = true,
        },
        prefix = "plain",
      },
      inlayHints = {
        enable = true,
        bindingModeHints = {
          enable = true,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = true,
        },
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = true,
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = true,
          hideNamedConstructor = true,
        },
      },
      joinLines = {
        joinAssignments = true,
        joinElseIf = true,
        removeTrailingComma = true,
        unwrapTrivialBlock = true,
      },
      lens = {
        enable = true,
        debug = {
          enable = true,
        },
        forceCustomCommands = true,
        implementations = {
          enable = true,
        },
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
        run = {
          enable = true,
        },
      },
      lruCapacity = 1024,
      notifications = {
        cargoTomlNotFound = true,
      },
      procMacro = {
        enable = true,
      },
      rustfmt = {
        rangeFormatting = {
          enable = true,
        },
      },
      semanticHighlighting = {
        strings = {
          enable = true,
        },
      },
      signatureInfo = {
        detail = "full",
        documentation = {
          enable = true,
        },
      },
      workspace = {
        symbol = {
          search = {
            kind = "only_types",
            scope = "workspace",
          },
        },
      },
    },
  },
}
