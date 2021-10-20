require("lint").linters_by_ft = {
  markdown = { "vale" },
  c = { "clangtidy", "clazy" },
  -- python = { "flake8", "mypy" },
  sh = { "shellcheck" },
}

vim.cmd([[au BufWritePost <buffer> lua require('lint').try_lint()]])
