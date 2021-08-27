require("telescope").load_extension("projects")

local function ivy_live_grep()
  require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({}))
end

local function ivy_find_files()
  require("telescope.builtin").find_files(require("telescope.themes").get_ivy({}))
end

local function ivy_man_pages()
  require("telescope.builtin").man_pages(require("telescope.themes").get_ivy({}))
end

local function ivy_help_tags()
  require("telescope.builtin").help_tags(require("telescope.themes").get_ivy({}))
end

local function ivy_vim_options()
  require("telescope.builtin").vim_options(require("telescope.themes").get_ivy({}))
end

local function ivy_file_browser()
  require("telescope.builtin").file_browser(require("telescope.themes").get_ivy({}))
end

local function ivy_lsp_implementations()
  require("telescope.builtin").lsp_implementations(require("telescope.themes").get_ivy({}))
end

return {
  find_files = ivy_find_files,
  live_grep = ivy_live_grep,
  man_pages = ivy_man_pages,
  help_tags = ivy_help_tags,
  file_browser = ivy_file_browser,
  vim_options = ivy_vim_options,
  lsp_implementations = ivy_lsp_implementations,
}
