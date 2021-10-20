local jdtls_dir = vim.fn.stdpath("cache") .. "/jdtls"
local cs_env = vim.fn.systemlist("cs java --jvm 11 --env")
for _, var in ipairs(cs_env) do
  local env_var = vim.split(vim.split(var, " ")[2], "=")
  if env_var[1] == "JAVA_HOME" then
    vim.env[env_var[1]] = string.gsub(env_var[2], [["]], "")
  end
end

local launcher_jar = function()
  local fd_cmd = string.format([[fd "launcher_" %s/plugins]], jdtls_dir)
  return vim.fn.systemlist(fd_cmd)[1]
end

local os_config = function()
  if vim.fn.has("mac") == 1 then
    return "mac"
  end
  return "linux"
end

local config = {
  -- The command that starts the language server
  cmd = {
    string.format("%s/bin/java", vim.env.JAVA_HOME),
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xmx1G",
    "-jar",
    launcher_jar(),
    "-configuration",
    string.format("%s/config_%s", jdtls_dir, os_config()),
    "-data",
    string.format("%s/workspace", vim.fn.stdpath("cache")),
    "--add-modules=ALL-SYSTEM",
    "--add-opens java.base/java.util=ALL-UNNAMED",
    "--add-opens java.base/java.lang=ALL-UNNAMED",
    -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
  },

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}
require("jdtls").start_or_attach(config)
