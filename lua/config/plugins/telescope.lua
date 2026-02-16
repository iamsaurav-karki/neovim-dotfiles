-- ============================================================
-- Plugin: Telescope — fuzzy finder
-- ============================================================
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions   = require("telescope.actions")

      -- Shim: v0.1.9 mappings reference mouse_click/double_mouse_click
      -- but the actions module doesn't define them yet — add no-ops
      local mt = getmetatable(actions)
      if mt and mt.__index then
        local orig_index = mt.__index
        mt.__index = function(tbl, key)
          if key == "mouse_click" or key == "double_mouse_click" then
            return function() end  -- no-op
          end
          if type(orig_index) == "function" then
            return orig_index(tbl, key)
          end
          return orig_index[key]
        end
      end

      telescope.setup({
        defaults = {
          prompt_prefix   = "   ",
          selection_caret = "  ",
          path_display    = { "truncate" },
          sorting_strategy  = "ascending",
          layout_strategy   = "horizontal",
          layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            width  = 0.87,
            height = 0.80,
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"]  = actions.close,
            },
          },
          file_ignore_patterns = {
            "node_modules", ".git/", ".terraform/", "__pycache__",
          },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep  = { additional_args = function() return { "--hidden" } end },
        },
      })

      -- Load fzf extension for better performance
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
