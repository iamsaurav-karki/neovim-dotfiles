-- ============================================================
-- Plugin: lualine — beautiful status line with rich info
-- ============================================================
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Custom colors matching our theme
      local colors = {
        bg       = "#1e2030",
        fg       = "#c0caf5",
        blue     = "#82aaff",
        cyan     = "#7dcfff",
        green    = "#c3e88d",
        orange   = "#ff9e64",
        magenta  = "#bb9af7",
        red      = "#f7768e",
        yellow   = "#e0af68",
        teal     = "#73daca",
        dark_bg  = "#16161e",
      }

      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = { left = "│", right = "│" },
          section_separators   = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "alpha", "dashboard" },
          },
        },
        sections = {
          lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
          },
          lualine_b = {
            { "branch", icon = "", color = { fg = colors.magenta, gui = "bold" } },
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
              diff_color = {
                added    = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed  = { fg = colors.red },
              },
            },
          },
          lualine_c = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              diagnostics_color = {
                error = { fg = colors.red },
                warn  = { fg = colors.yellow },
                info  = { fg = colors.cyan },
                hint  = { fg = colors.teal },
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              path = 1,
              symbols = { modified = " ●", readonly = " ", unnamed = " [No Name]" },
              color = { fg = colors.fg, gui = "bold" },
            },
          },
          lualine_x = {
            -- Show active LSP servers
            {
              function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients == 0 then return "" end
                local names = {}
                for _, c in ipairs(clients) do
                  table.insert(names, c.name)
                end
                return " " .. table.concat(names, ", ")
              end,
              color = { fg = colors.teal },
            },
            { "encoding", color = { fg = colors.fg } },
            {
              "fileformat",
              symbols = { unix = " LF", dos = " CRLF", mac = " CR" },
              color = { fg = colors.fg },
            },
          },
          lualine_y = {
            { "progress", color = { fg = colors.cyan, gui = "bold" } },
          },
          lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { "nvim-tree", "toggleterm", "lazy" },
      })
    end,
  },
}
