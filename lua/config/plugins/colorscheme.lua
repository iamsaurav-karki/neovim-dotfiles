-- ============================================================
-- Plugin: Catppuccin colorscheme — vivid colors for DevOps
-- Enhanced with custom highlights for YAML, numbers, keywords
-- ============================================================
return {
  {
    "catppuccin/nvim",
    name     = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        term_colors = true,
        styles = {
          comments    = { "italic" },
          conditionals = { "italic", "bold" },
          functions   = { "bold" },
          keywords    = { "italic" },
          strings     = {},
          variables   = {},
          types       = { "bold" },
        },
        integrations = {
          cmp        = true,
          gitsigns   = true,
          nvimtree   = true,
          telescope  = { enabled = true },
          treesitter = true,
          mason      = true,
          indent_blankline = { enabled = true },
          native_lsp = {
            enabled = true,
            underlines = {
              errors      = { "undercurl" },
              hints       = { "undercurl" },
              warnings    = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
        custom_highlights = function(colors)
          return {
            -- ── YAML / Config keys — bright cyan ──────────
            ["@property.yaml"]     = { fg = "#7dcfff", bold = true },
            ["@field.yaml"]        = { fg = "#7dcfff", bold = true },
            ["@label.yaml"]        = { fg = "#7dcfff", bold = true },
            ["yamlBlockMappingKey"] = { fg = "#7dcfff", bold = true },
            ["yamlKey"]            = { fg = "#7dcfff", bold = true },

            -- ── Strings — warm green ──────────────────────
            ["@string"]            = { fg = "#9ece6a" },
            ["String"]             = { fg = "#9ece6a" },

            -- ── Numbers — bright orange ───────────────────
            ["@number"]            = { fg = "#ff9e64", bold = true },
            ["Number"]             = { fg = "#ff9e64", bold = true },
            ["@float"]             = { fg = "#ff9e64" },
            ["Float"]              = { fg = "#ff9e64" },

            -- ── Booleans — bright magenta ─────────────────
            ["@boolean"]           = { fg = "#ff007c", bold = true },
            ["Boolean"]            = { fg = "#ff007c", bold = true },

            -- ── Comments — soft gray italic ───────────────
            ["@comment"]           = { fg = "#6a6f87", italic = true },
            ["Comment"]            = { fg = "#6a6f87", italic = true },

            -- ── Keywords — bright purple ──────────────────
            ["@keyword"]           = { fg = "#bb9af7", italic = true },
            ["Keyword"]            = { fg = "#bb9af7", italic = true },

            -- ── Functions — bright blue ───────────────────
            ["@function"]          = { fg = "#7aa2f7", bold = true },
            ["Function"]           = { fg = "#7aa2f7", bold = true },
            ["@function.call"]     = { fg = "#7aa2f7" },

            -- ── Types — teal ──────────────────────────────
            ["@type"]              = { fg = "#2ac3de", bold = true },
            ["Type"]               = { fg = "#2ac3de", bold = true },

            -- ── Operators — bright white ──────────────────
            ["@operator"]          = { fg = "#c0caf5" },
            ["Operator"]           = { fg = "#c0caf5" },

            -- ── Punctuation — soft blue ───────────────────
            ["@punctuation.bracket"]   = { fg = "#a9b1d6" },
            ["@punctuation.delimiter"] = { fg = "#a9b1d6" },
            ["@punctuation.special"]   = { fg = "#e0af68" },  -- YAML special chars (: - |)

            -- ── Variables — light lavender ────────────────
            ["@variable"]          = { fg = "#c0caf5" },
            ["Identifier"]         = { fg = "#c0caf5" },

            -- ── Tags (YAML/HTML) — rose ───────────────────
            ["@tag"]               = { fg = "#f7768e" },
            ["@tag.attribute"]     = { fg = "#e0af68" },

            -- ── Namespaces / Modules — gold ───────────────
            ["@namespace"]         = { fg = "#e0af68", italic = true },

            -- ── Constants — peach ─────────────────────────
            ["@constant"]          = { fg = "#ff9e64" },
            ["Constant"]           = { fg = "#ff9e64" },
            ["@constant.builtin"]  = { fg = "#ff9e64", italic = true },

            -- ── Terraform / HCL specific ──────────────────
            ["@keyword.hcl"]       = { fg = "#bb9af7", bold = true },
            ["@property.hcl"]      = { fg = "#73daca" },
            ["@string.hcl"]        = { fg = "#9ece6a" },
            ["@type.hcl"]          = { fg = "#2ac3de", bold = true },

            -- ── Docker ────────────────────────────────────
            ["@keyword.dockerfile"] = { fg = "#7aa2f7", bold = true },

            -- ── JSON keys — bright cyan ───────────────────
            ["@property.json"]     = { fg = "#7dcfff", bold = true },
            ["@label.json"]        = { fg = "#7dcfff", bold = true },
            ["@property.jsonc"]    = { fg = "#7dcfff", bold = true },

            -- ── Markdown ──────────────────────────────────
            ["@markup.heading"]    = { fg = "#7aa2f7", bold = true },
            ["@markup.link"]       = { fg = "#73daca", underline = true },
            ["@markup.strong"]     = { fg = "#c0caf5", bold = true },
            ["@markup.italic"]     = { fg = "#c0caf5", italic = true },
            ["@markup.raw"]        = { fg = "#9ece6a" },

            -- ── Line number — more visible ────────────────
            LineNr        = { fg = "#565f89" },
            CursorLineNr  = { fg = "#e0af68", bold = true },
            CursorLine    = { bg = "#292e42" },

            -- ── Visual selection — visible blue ───────────
            Visual         = { bg = "#33467c", bold = true },

            -- ── Search highlights ─────────────────────────
            Search         = { fg = "#1a1b26", bg = "#e0af68", bold = true },
            IncSearch      = { fg = "#1a1b26", bg = "#ff9e64", bold = true },

            -- ── Matching parentheses ──────────────────────
            MatchParen     = { fg = "#ff9e64", bg = "#3b4261", bold = true },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
