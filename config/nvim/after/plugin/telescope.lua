local telescope = require("telescope")
local themes = require("telescope.themes")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["<C-c>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    ["ui-select"] = {
      themes.get_cursor({}),
    },
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    project = {
      base_dirs = {
        { path = "~/vcs/", max_depth = 5 },
        -- { path = "~/exercism", max_depth = 3 },
      },
      hidden_files = false, -- default: false
    },
  },
})

for _, extension in ipairs({ "ui-select", "file_browser", "fzf", "live_grep_raw", "gh", "project" }) do
  telescope.load_extension(extension)
end

-- Return a new instance of the opt table instead of re-using
local function get_ivy_opts()
  return themes.get_ivy({
    layout_config = {
      preview_cutoff = 1, -- Preview should always show (unless previewer = false)

      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,
    },
  })
end

local ivy = setmetatable({
  project_files = function()
    local ok = pcall(require("telescope.builtin").git_files, get_ivy_opts())
    if not ok then
      require("telescope.builtin").find_files(get_ivy_opts())
    end
  end,
  project = function()
    local proj_opts = get_ivy_opts()
    proj_opts.display_type = "full"
    telescope.extensions.project.project(proj_opts)
  end,
}, {
  __index = function(_, function_call)
    local extensions = vim.tbl_keys(telescope.extensions)
    if vim.tbl_contains(extensions, function_call) then
      return function()
        local ivy_opts = get_ivy_opts()
        telescope.extensions[function_call][function_call](ivy_opts)
      end
    end
    return function()
      require("telescope.builtin")[function_call](get_ivy_opts())
    end
  end,
})

-- vim.keymap.set("n", " ff", ivy.project_files)
-- vim.keymap.set("n", " ff", ivy.find_files)
vim.keymap.set("n", " ff", ivy.git_files)
vim.keymap.set("n", " fg", ivy.live_grep_raw)
vim.keymap.set("n", " fG", ivy.grep_string)
vim.keymap.set("n", " fh", ivy.help_tags)
vim.keymap.set("n", " fj", ivy.file_browser)
vim.keymap.set("n", " fb", ivy.buffers)
vim.keymap.set("n", " fm", ivy.man_pages)
vim.keymap.set("n", "gI", ivy.lsp_implementations)
vim.keymap.set("n", " fp", ivy.project)

vim.api.nvim_create_user_command("Gh", function(opts)
  local fargs = opts.fargs
  -- require("telescope.command").load_command(unpack(opts.fargs))
end, {
  nargs = "*",
  complete = function(_, line)
    local actions = {
      ["pull_request"] = { "author", "assignee", "label", "search", "state", "base", "limit" },
      ["issue"] = { "author", "assignee", "mention", "label", "milestone", "search", "state", "limit" },
    }

    local l = vim.split(line, "%s+")
    local n = #l - 2

    if n == 0 then
      return vim.tbl_filter(function(val)
        return vim.startswith(val, l[2])
      end, vim.tbl_extend("force", actions, extensions_list))
    end

    if n == 1 then
      local is_extension = vim.tbl_filter(function(val)
        return val == l[2]
      end, extensions_list)

      if #is_extension > 0 then
        local extensions_subcommand_dict = require("telescope.command").get_extensions_subcommand()
        return vim.tbl_filter(function(val)
          return vim.startswith(val, l[3])
        end, extensions_subcommand_dict[l[2]])
      end
    end

    local options_list = vim.tbl_keys(require("telescope.config").values)
    return vim.tbl_filter(function(val)
      return vim.startswith(val, l[#l])
    end, options_list)
  end,
})
