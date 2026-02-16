-- ============================================================
-- Plugin: alpha-nvim — Dashboard / welcome screen
-- ============================================================
return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- ── ASCII Art Header ──────────────────────────────────
      dashboard.section.header.val = {
        [[                                                    ]],
        [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
        [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
        [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
        [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
        [[                                                    ]],
        [[               By Saurav Karki.                     ]],
      }

      -- ── Menu Buttons (matching screenshot) ────────────────
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file",       "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files",    "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("g", "  Grep text",       "<cmd>Telescope live_grep<CR>"),
        dashboard.button("e", "  New file",        "<cmd>ene <BAR> startinsert<CR>"),
        dashboard.button("c", "  Configuration",   "<cmd>e $MYVIMRC<CR>"),
        dashboard.button("q", "  Quit",            "<cmd>qa<CR>"),
      }

      -- ── Footer ────────────────────────────────────────────
      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        return "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"
      end

      -- ── Styling ───────────────────────────────────────────
      dashboard.section.header.opts.hl  = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl  = "AlphaFooter"

      -- Spacing
      dashboard.opts.layout = {
        { type = "padding", val = 4 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.opts)

      -- Highlight groups for the dashboard
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          vim.opt_local.laststatus = 0
          vim.opt_local.showtabline = 0
          vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            callback = function()
              vim.opt.laststatus = 3
              vim.opt.showtabline = 2
            end,
          })
        end,
      })
    end,
  },
}
