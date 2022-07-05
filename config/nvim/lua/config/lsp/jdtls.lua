local os_config = function()
  if vim.fn.has("mac") == 1 then
    return "mac"
  end
  return "linux"
end

local namespace = {
  eclipse = "org.eclipse.equinox",
  microsoft = "com.microsoft.java",
}

local dir_path = {
  jdtls = vim.fn.stdpath("cache") .. "/jdtls",
  java_debug = vim.fn.stdpath("cache") .. "/jdtls/java-debug",
  java_test = vim.fn.stdpath("cache") .. "/jdtls/vscode-java-test",
}

local jar_path = {
  jdtls = string.format("%s/plugins/org.eclipse.equinox.launcher_*.jar", dir_path.jdtls),
  java_debug = string.format(
    "%s/%s.debug.plugin/target/%s.debug.plugin-*.jar",
    dir_path.java_debug,
    namespace.microsoft,
    namespace.microsoft
  ),
  java_test = string.format("%s/server/*jar", dir_path.java_test),
}

local cmd = {
  string.format("%s/bin/java", vim.env.JAVA_HOME),
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.level=ALL",
  "-noverify",
  "-Xmx1G",
  "-jar",
  vim.fn.glob(jar_path.jdtls),
  "-configuration",
  string.format("%s/config_%s", dir_path.jdtls, os_config()),
  "-data",
  string.format("%s/workspace", vim.fn.stdpath("cache")),
  "--add-modules=ALL-SYSTEM",
  "--add-opens java.base/java.util=ALL-UNNAMED",
  "--add-opens java.base/java.lang=ALL-UNNAMED",
  -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
}

local border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}

local on_attach = function(client, bufnr)
  require("jdtls.setup").add_commands()
  require("jdtls").setup_dap()

  vim.lsp.set_log_level(0)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Fancy borders
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

  vim.keymap.set("n", "gpd", require("goto-preview").goto_preview_definition)
  vim.keymap.set("n", "gpi", require("goto-preview").goto_preview_implementation)
  vim.keymap.set("n", "gP", require("goto-preview").close_all_win)
  -- Only set if you have telescope installed
  vim.keymap.set("n", "gpr", require("goto-preview").goto_preview_references)

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
  vim.keymap.set("n", " K>", vim.lsp.buf.signature_help)
  vim.keymap.set("n", " wa", vim.lsp.buf.add_workspace_folder)
  vim.keymap.set("n", " wr", vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set("n", " D", vim.lsp.buf.type_definition)
  vim.keymap.set("n", " rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set("n", " ca", vim.lsp.buf.code_action)
  vim.keymap.set("v", " ca", vim.lsp.buf.range_code_action)
  -- vim.keymap.set("n", " e", vim.diagnostic.show_line_diagnostics )
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", " q", vim.diagnostic.setloclist)

  -- Java specific
  vim.keymap.set("n", " di", require("jdtls").organize_imports)
  vim.keymap.set("n", " dt", require("jdtls").test_class)
  vim.keymap.set("n", " dn", require("jdtls").test_nearest_method)
  -- nnoremap({" de", require('jdtls').extract_variable(true)<CR>", opts)
  vim.keymap.set("n", " de", require("jdtls").extract_variable)
  -- nnoremap({" dm", require('jdtls').extract_method(true)<CR>", opts)

  -- vim.keymap.set("n", " cf", vim.lsp.buf.formatting )

  vim.api.nvim_exec(
    [[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
      ]],
    false
  )
end

local bundles = {
  vim.fn.glob(jar_path.java_debug),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(jar_path.java_test), "\n"))

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local init_options = {
  bundles = bundles,
  extendedClientCapabilities = extendedClientCapabilities,
}

local root_markers = { ".git", "mvnw", "gradlew" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local capabilities = {
  workspace = {
    configuration = true,
  },
  textDocument = {
    completion = {
      completionItem = {
        snippetSupport = true,
      },
    },
  },
}

local workspace_folder = vim.env.HOME .. "/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local settings = {
  ["java.format.settings.url"] = vim.env.HOME .. "/.config/nvim/language-servers/java-google-formatter.xml",
  ["java.format.settings.profile"] = "GoogleStyle",
  java = {
    signatureHelp = { enabled = true },
    contentProvider = { preferred = "fernflower" },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
    },
    configuration = {
      runtimes = {
        {
          name = "JavaSE-11",
          path = vim.env.HOME .. "/.sdkman/candidates/java/11.0.10-open/",
        },
        {
          name = "JavaSE-14",
          path = vim.env.HOME .. "/.sdkman/candidates/java/14.0.2-open/",
        },
        {
          name = "JavaSE-15",
          path = vim.env.HOME .. "/.sdkman/candidates/java/15.0.1-open/",
        },
      },
    },
  },
}

local config = {
  flags = {
    allow_incremental_sync = true,
  },
  -- The command that starts the language server
  cmd = cmd,
  init_options = init_options,
  settings = settings,
  capabilities = capabilities,
  on_attach = on_attach,

  root_dir = root_dir,
}
config.on_init = function(client, _)
  client.notify("workspace/didChangeConfiguration", { settings = config.settings })
end

return config
