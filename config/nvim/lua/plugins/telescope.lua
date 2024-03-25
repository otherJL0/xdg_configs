return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
      },
      {
        "<leader>fj",
        function()
          require("telescope").extensions.file_browser.file_browser()
        end,
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      pickers = {
        help_tags = { theme = "ivy" },
        find_files = { theme = "ivy" },
        git_files = { theme = "ivy" },
        grep_string = { theme = "ivy" },
        buffers = { theme = "ivy" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          overrride_file_sorter = true,
        },
        live_grep_args = {
          auto_quoting = false,
          theme = "ivy",
        },
        file_browser = {
          highjack_netrw = true,
          auto_depth = true,
          hidden = true,
          theme = "ivy",
        },
      },
    },
  },

  -- add telescope-fzf-native
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
  },

  { "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
  { "nvim-telescope/telescope-live-grep-args.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
}
