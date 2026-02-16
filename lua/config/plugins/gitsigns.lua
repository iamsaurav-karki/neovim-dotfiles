-- ============================================================
-- Plugin: gitsigns — Git decorations & hunk actions
-- Bold, vivid VS Code-style colors for clear git tracking
-- ============================================================
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- ── VIVID git sign colors (gutter bar) ─────────────────
      vim.api.nvim_set_hl(0, "GitSignsAdd",          { fg = "#73daca", bold = true })   -- bright green
      vim.api.nvim_set_hl(0, "GitSignsChange",       { fg = "#7aa2f7", bold = true })   -- bright blue
      vim.api.nvim_set_hl(0, "GitSignsDelete",       { fg = "#f7768e", bold = true })   -- bright red/pink
      vim.api.nvim_set_hl(0, "GitSignsTopdelete",    { fg = "#f7768e", bold = true })
      vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#e0af68", bold = true })   -- bright yellow
      vim.api.nvim_set_hl(0, "GitSignsUntracked",    { fg = "#bb9af7", bold = true })   -- bright purple

      -- ── Staged sign colors (slightly dimmer) ──────────────
      vim.api.nvim_set_hl(0, "GitSignsStagedAdd",          { fg = "#449dab" })
      vim.api.nvim_set_hl(0, "GitSignsStagedChange",       { fg = "#5a7abf" })
      vim.api.nvim_set_hl(0, "GitSignsStagedDelete",       { fg = "#b5555e" })
      vim.api.nvim_set_hl(0, "GitSignsStagedTopdelete",    { fg = "#b5555e" })
      vim.api.nvim_set_hl(0, "GitSignsStagedChangedelete", { fg = "#b08840" })

      -- ── Inline diff highlights (background tints) ─────────
      vim.api.nvim_set_hl(0, "DiffAdd",    { bg = "#1a3a2a" })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1a2a3a" })
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3a1a1a" })
      vim.api.nvim_set_hl(0, "DiffText",   { bg = "#2a3a5a", bold = true })

      -- ── Line highlights for added/changed/removed in buffer
      vim.api.nvim_set_hl(0, "GitSignsAddLn",    { bg = "#1a3a2a" })
      vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = "#1a2a3a" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = "#3a1a1a" })

      -- ── Word-level diff highlights ─────────────────────────
      vim.api.nvim_set_hl(0, "GitSignsAddInline",    { bg = "#264f3d" })
      vim.api.nvim_set_hl(0, "GitSignsChangeInline", { bg = "#264f78" })
      vim.api.nvim_set_hl(0, "GitSignsDeleteInline", { bg = "#6b2029" })

      -- ── Blame virtual text (subtle but readable) ──────────
      vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#565f89", italic = true })

      require("gitsigns").setup({
        signs = {
          add          = { text = "┃" },  -- thick bar for visibility
          change       = { text = "┃" },
          delete       = { text = "▸" },  -- triangle pointing right
          topdelete    = { text = "▸" },
          changedelete = { text = "┃" },
          untracked    = { text = "┆" },  -- dotted bar = untracked
        },
        signs_staged = {
          add          = { text = "│" },  -- thinner bar = staged
          change       = { text = "│" },
          delete       = { text = "▹" },
          topdelete    = { text = "▹" },
          changedelete = { text = "│" },
          untracked    = { text = "│" },
        },
        signs_staged_enable = true,
        word_diff            = false,
        current_line_blame   = true,
        current_line_blame_opts = {
          virt_text     = true,
          virt_text_pos = "eol",
          delay         = 300,
        },
        current_line_blame_formatter = "   <author>, <author_time:%R> • <summary>",
        diff_opts = { internal = true },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end
          -- Navigation
          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, "Next git hunk")
          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, "Prev git hunk")
          -- Actions
          map("n", "<leader>hs", gs.stage_hunk,      "Stage hunk")
          map("n", "<leader>hr", gs.reset_hunk,      "Reset hunk")
          map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage selected")
          map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset selected")
          map("n", "<leader>hS", gs.stage_buffer,    "Stage buffer")
          map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
          map("n", "<leader>hR", gs.reset_buffer,    "Reset buffer")
          map("n", "<leader>hp", gs.preview_hunk,    "Preview hunk")
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
          map("n", "<leader>hd", gs.diffthis,        "Diff this")
          map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff this (~)")
          map("n", "<leader>ht", gs.toggle_deleted,  "Toggle deleted lines")
        end,
      })
    end,
  },
}
