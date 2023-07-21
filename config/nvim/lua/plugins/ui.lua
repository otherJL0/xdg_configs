return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = "catppuccin", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_trailing_blankline_indent = true,
      filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "",
        "Outline",
        "tsplayground",
      },
      show_end_of_line = true,
      buftype_exclude = { "nofile", "terminal", "help", "tsplayground", "Outline" },

      use_treesitter = true,
      char = "▎",
      context_char = "▎",
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      show_current_context_start_on_current_line = true,
      show_first_indent_level = true,
      use_treesiter_scope = true,
    },
  },

  {
    "HampusHauffman/block.nvim",
    opts = {
      percent = 0.97,
      automatic = false,
    },
  },

  { "Bekaboo/dropbar.nvim" },

  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    opts = {
      animation = { enable = true },
    },
  },

  {
    "dnlhc/glance.nvim",
    opts = {
      detached = true,
      border = {
        enable = true,
        top_char = "▔",
        bottom_char = "▁",
      },
      theme = {
        enable = true,
        mode = "brighten",
      },
    },
  },

  -- default config
  -- {
  --   "3rd/image.nvim",
  --   dependencies = {
  --     { dir = "~/luarocks/share/lua/5.1/magick" },
  --   },
  --   opts = {
  --     backend = "kitty",
  --     integrations = {
  --       markdown = {
  --         enabled = true,
  --         sizing_strategy = "auto",
  --         download_remote_images = true,
  --         clear_in_insert_mode = false,
  --       },
  --       neorg = {
  --         enabled = true,
  --         download_remote_images = true,
  --         clear_in_insert_mode = false,
  --       },
  --     },
  --     max_width = nil,
  --     max_height = nil,
  --     max_width_window_percentage = nil,
  --     max_height_window_percentage = 50,
  --     kitty_method = "normal",
  --     kitty_tmux_write_delay = 10, -- makes rendering more reliable with Kitty+Tmux
  --     window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   },
  -- },
}
