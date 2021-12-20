return {
  cmd = { "rust-analyzer" },
  on_attach = require("config.lsp").on_attach,
  filetypes = { "rust" },
  root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "crate",
        importEnforceGranularity = false,
        importPrefix = "plain",
        importGroup = true,
        allowMergingIntoGlobImports = false,
      },
      cache = {
        warmup = true,
      },
      callInfo = {
        full = true,
      },
      cargo = {
        autoreload = true,
        allFeatures = false,
        unsetTest = { "core" },
        features = {},
        runBuildScripts = true,
        useRustcWrapperForBuildScripts = true,
        noDefaultFeatures = false,
        target = vim.NIL,
        noSysroot = false,
      },
      checkOnSave = {
        enable = true,
        allFeatures = vim.NIL,
        allTargets = true,
        command = "check",
        noDefaultFeatures = vim.NIL,
        target = vim.NIL,
        extraArgs = {},
        features = vim.NIL,
        overrideCommand = vim.NIL,
      },
      completion = {
        addCallArgumentSnippets = true,
        addCallParenthesis = true,
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
      debug = {
        engine = "auto",
        openDebugPane = true,
      },
      diagnostics = {
        enable = true,
        enableExperimental = true,
        disabled = {},
        remapPrefix = vim.empty_dict(),
        warningsAsHint = {},
        warningsAsInfo = {},
      },
      experimental = {
        procAttrMacros = true,
      },
      files = {
        watcher = "client",
        excludeDirs = {},
      },
      highlightRelated = {
        references = true,
        exitPoints = true,
        breakPoints = true,
        yieldPoints = true,
        strings = true,
      },
      hover = {
        documentation = true,
        linksInHover = true,
      },
      hoverActions = {
        debug = true,
        enable = true,
        gotoTypeDef = true,
        implementations = true,
        references = true,
        run = true,
      },
      inlayHints = {
        enable = true,
        chainingHints = true,
        maxLength = 25,
        parameterHints = true,
        typeHints = true,
        hideNamedConstructorHints = false,
      },
      joinLines = {
        joinElseIf = true,
        removeTrailingComma = true,
        unwrapTrivialBlock = true,
        joinAssignments = true,
      },
      lens = {
        debug = true,
        enable = true,
        implementations = true,
        run = true,
        methodReferences = true,
        references = true,
        enumVariantReferences = true,
        forceCustomCommands = true,
      },
      linkedProjects = {},
      lruCapacity = 128,
      notifications = {
        cargoTomlNotFound = true,
      },
      procMacro = {
        enable = true,
        server = vim.NIL,
      },
      runnables = {
        overrideCargo = vim.NIL,
        cargoExtraArgs = {},
      },
      rustcSource = vim.NIL,
      rustfmt = {
        extraArgs = {},
        overrideCommand = vim.NIL,
        enableRangeFormatting = true,
      },
      updates = {
        channel = "nightly",
      },
      workspace = {
        symbol = {
          search = {
            scope = "workspace",
            kind = "only_types",
          },
        },
      },
    },
  },
}
