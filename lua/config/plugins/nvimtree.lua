-- ============================================================
-- Plugin: nvim-tree — file explorer with vivid git status colors
-- ============================================================
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Disable netrw (recommended by nvim-tree)
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1

      -- ── Vivid git colors for file explorer ──────────────────
      -- File names in the tree get colored by git status
      vim.api.nvim_set_hl(0, "NvimTreeGitNew",       { fg = "#73daca", bold = true })    -- new/untracked = bright green
      vim.api.nvim_set_hl(0, "NvimTreeGitDirty",     { fg = "#e0af68", bold = true })    -- modified/dirty = bright yellow
      vim.api.nvim_set_hl(0, "NvimTreeGitStaged",    { fg = "#7aa2f7", bold = true })    -- staged = bright blue
      vim.api.nvim_set_hl(0, "NvimTreeGitRenamed",   { fg = "#bb9af7", bold = true })    -- renamed = bright purple
      vim.api.nvim_set_hl(0, "NvimTreeGitDeleted",   { fg = "#f7768e", bold = true })    -- deleted = bright red
      vim.api.nvim_set_hl(0, "NvimTreeGitMerge",     { fg = "#ff9e64", bold = true })    -- merge conflict = orange
      vim.api.nvim_set_hl(0, "NvimTreeGitIgnored",   { fg = "#565f89", italic = true })  -- ignored = dim gray

      -- Git status icon colors
      vim.api.nvim_set_hl(0, "NvimTreeGitFileNewHL",       { fg = "#73daca" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileDirtyHL",     { fg = "#e0af68" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileStagedHL",    { fg = "#7aa2f7" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileRenamedHL",   { fg = "#bb9af7" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileDeletedHL",   { fg = "#f7768e" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileMergeHL",     { fg = "#ff9e64" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFileIgnoredHL",   { fg = "#565f89" })

      -- Folder git status colors
      vim.api.nvim_set_hl(0, "NvimTreeGitFolderNewHL",     { fg = "#73daca" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFolderDirtyHL",   { fg = "#e0af68" })
      vim.api.nvim_set_hl(0, "NvimTreeGitFolderStagedHL",  { fg = "#7aa2f7" })

      -- Folder & file general highlights
      vim.api.nvim_set_hl(0, "NvimTreeFolderName",  { fg = "#7aa2f7" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#7dcfff", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeRootFolder",  { fg = "#bb9af7", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = "#ff9e64", bold = true, underline = true })

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side  = "left",
        },
        renderer = {
          group_empty = true,
          highlight_git = "all",         -- color file names + folders by git status
          highlight_opened_files = "name",
          highlight_modified = "name",
          indent_markers = {
            enable = true,
            icons  = { corner = "└", edge = "│", item = "│", none = " " },
          },
          icons = {
            show = {
              file         = true,
              folder       = true,
              folder_arrow = true,
              git          = true,
              modified     = true,
            },
            git_placement = "after",    -- git icons after filename
            modified_placement = "after",
            glyphs = {
              git = {
                unstaged  = "●",       -- bright dot = modified
                staged    = "✓",       -- checkmark = staged
                unmerged  = "",       -- merge conflict
                renamed   = "➜",
                untracked = "★",       -- star = new file
                deleted   = "✗",       -- X = deleted
                ignored   = "◌",       -- hollow dot = ignored
              },
            },
          },
        },
        modified = {
          enable = true,
          show_on_dirs = true,
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = { hint = "", info = "", warning = "", error = "" },
        },
        filters = {
          dotfiles = false,
          custom   = { ".git", "node_modules", ".terraform", "__pycache__" },
        },
        git = {
          enable  = true,
          ignore  = false,
          timeout = 500,
        },
        actions = {
          open_file = { quit_on_open = false },
        },
      })
    end,
  },
}
