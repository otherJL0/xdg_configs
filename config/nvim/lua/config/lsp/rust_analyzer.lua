return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "crate",
        importEnforceGranularity = false,
        importPrefix = "plain",
        importGroup = true,
        allowMergingIntoGlobImports = true,
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
        target = nil,
        noSysroot = false,
      },
      checkOnSave = {
        enable = true,
        allFeatures = nil,
        allTargets = true,
        command = "check",
        noDefaultFeatures = nil,
        target = nil,
        extraArgs = {},
        features = nil,
        overrideCommand = nil,
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
      diagnostics = {
        enable = true,
        enableExperimental = true,
        disabled = {},
        remapPrefix = {},
        warningsAsHint = {},
        warningsAsInfo = {},
      },
      experimental = {
        procAttrMacros = false,
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
        references = false,
        run = true,
      },
      inlayHints = {
        chainingHints = true,
        maxLength = 25,
        parameterHints = true,
        typeHints = true,
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
        methodReferences = false,
        references = false,
        forceCustomCommands = true,
      },
      linkedProjects = {},
      lruCapacity = nil,
      notifications = {

        cargoTomlNotFound = true,
      },
      procMacro = {
        enable = true,
        server = nil,
      },
      runnables = {

        overrideCargo = nil,
        cargoExtraArgs = {},
      },
      rustcSource = nil,
      rustfmt = {

        extraArgs = {},
        overrideCommand = nil,
        enableRangeFormatting = false,
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
