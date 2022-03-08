return {
  cmd = { vim.fn.stdpath("cache") .. "/node_modules/.bin/" .. "bash-language-server", "start" },
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
  },
  filetypes = { "sh", "bash" },
}
