-- ============================================================
-- Plugin: bufferline — VS Code-style tabs for open files
-- ============================================================
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          style_preset = require("bufferline").style_preset.default,
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = "bdelete! %d",

          -- Tab appearance
          indicator = {
            icon = "▎",
            style = "icon",
          },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",

          -- Show buffer number for quick switching
          max_name_length = 30,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 20,

          -- Diagnostics from LSP shown on tabs
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,

          -- Offset for nvim-tree sidebar
          offsets = {
            {
              filetype = "NvimTree",
              text = " File Explorer",
              text_align = "center",
              highlight = "Directory",
              separator = true,
            },
          },

          -- Visual options
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          persist_buffer_sort = true,
          separator_style = "slant",
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          sort_by = "insert_after_current",

          -- Hover effects
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
        },

        -- Theme colors matching our catppuccin setup
        highlights = {
          fill             = { bg = "#16161e" },
          background       = { fg = "#565f89", bg = "#1e2030" },
          buffer_selected  = { fg = "#c0caf5", bg = "#1a1b26", bold = true, italic = false },
          buffer_visible   = { fg = "#737aa2", bg = "#1e2030" },
          close_button           = { fg = "#565f89", bg = "#1e2030" },
          close_button_selected  = { fg = "#f7768e", bg = "#1a1b26" },
          close_button_visible   = { fg = "#565f89", bg = "#1e2030" },
          modified               = { fg = "#e0af68", bg = "#1e2030" },
          modified_selected      = { fg = "#e0af68", bg = "#1a1b26" },
          modified_visible       = { fg = "#e0af68", bg = "#1e2030" },
          separator              = { fg = "#16161e", bg = "#1e2030" },
          separator_selected     = { fg = "#16161e", bg = "#1a1b26" },
          separator_visible      = { fg = "#16161e", bg = "#1e2030" },
          indicator_selected     = { fg = "#7dcfff", bg = "#1a1b26" },
          indicator_visible      = { fg = "#3b4261", bg = "#1e2030" },
          tab                    = { fg = "#565f89", bg = "#1e2030" },
          tab_selected           = { fg = "#c0caf5", bg = "#1a1b26", bold = true },
          tab_separator          = { fg = "#16161e", bg = "#1e2030" },
          tab_separator_selected = { fg = "#16161e", bg = "#1a1b26" },
          duplicate              = { fg = "#565f89", bg = "#1e2030", italic = true },
          duplicate_selected     = { fg = "#c0caf5", bg = "#1a1b26", italic = true },
          duplicate_visible      = { fg = "#565f89", bg = "#1e2030", italic = true },
          diagnostic_selected    = { bold = true },
          error_selected         = { fg = "#f7768e", bg = "#1a1b26", bold = true },
          warning_selected       = { fg = "#e0af68", bg = "#1a1b26", bold = true },
          info_selected          = { fg = "#7dcfff", bg = "#1a1b26", bold = true },
          hint_selected          = { fg = "#73daca", bg = "#1a1b26", bold = true },
        },
      })
    end,
  },

  -- Smart buffer deletion (doesn't close window/layout)
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
  },
}
