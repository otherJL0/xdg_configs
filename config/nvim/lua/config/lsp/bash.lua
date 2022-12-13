return {
  name = "bash-language-server",
  cmd = { "bash-language-server", "start" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".gitignore" }, { upward = true })[1]),
}
