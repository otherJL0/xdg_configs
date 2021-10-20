local jdtls_dir = vim.fn.stdpath("cache") .. "/jdtls"
if vim.fn.isdirectory(jdtls_dir) == 0 then
  local latest_url = "https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz"
  local temp_destination = "/tmp/jdtls.tar.gz"
  local target_destination = string.format("%s/jdtls", vim.fn.stdpath("cache"))
  vim.fn.mkdir(target_destination)
  local curl_cmd = string.format("curl -o %s %s", temp_destination, latest_url)
  local tar_cmd = string.format("tar xf %s -C %s", temp_destination, target_destination)
  vim.fn.system(curl_cmd)
  vim.fn.system(tar_cmd)
else
  vim.notify("Not working")
end
local cs_env = vim.fn.systemlist("cs java --jvm 11 --env")
for _, var in ipairs(cs_env) do
  local env_var = vim.split(vim.split(var, " ")[2], "=")
  vim.env[env_var[1]] = string.gsub(env_var[2], [["]], "")
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
    string.format("-jar %s", launcher_jar()),
    string.format("-configuration %s/config_%s", jdtls_dir, os_config()),
    "-data /path/to/data",
    "--add-modules=ALL-SYSTEM",
    "--add-opens java.base/java.util=ALL-UNNAMED",
    "--add-opens java.base/java.lang=ALL-UNNAMED",
    -- ADD REMAINING OPTIONS FROM https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line !
  },

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
}
require("jdtls").start_or_attach(config)
