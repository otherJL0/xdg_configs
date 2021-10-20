--
-- java \
-- 	-Declipse.application=org.eclipse.jdt.ls.core.id1 \
-- 	-Dosgi.bundles.defaultStartLevel=4 \
-- 	-Declipse.product=org.eclipse.jdt.ls.core.product \
-- 	-Dlog.level=ALL \
-- 	-noverify \
-- 	-Xmx1G \
-- 	-jar ./plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar \
-- 	-configuration ./config_linux \
-- 	-data /path/to/data \
-- 	--add-modules=ALL-SYSTEM \
-- 	--add-opens java.base/java.util=ALL-UNNAMED \
-- 	--add-opens java.base/java.lang=ALL-UNNAMED

local Job = require("plenary.job")

Job
  :new({
    command = "/usr/local/bin/cs",
    args = { "java", "--jvm", "11", "--env" },
    on_exit = function(j, return_val)
      vim.notify(return_val)
      vim.notify(j:result())
    end,
  })
  :start()

local config = {
  -- The command that starts the language server
  cmd = {
    "/path/to/java",
    "-Dosgi.bundles.defaultStartLevel=4",
    -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}

-- require("jdtls").start_or_attach(config)
