-- ============================================================
-- Plugin: Catppuccin colorscheme — rich, appealing DevOps theme
-- Vivid per-element colors: every syntax element gets its own hue
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
        dim_inactive = {
          enabled  = true,
          shade    = "dark",
          percentage = 0.15,
        },
        styles = {
          comments     = { "italic" },
          conditionals = { "italic", "bold" },
          functions    = { "bold" },
          keywords     = { "italic", "bold" },
          strings      = {},
          variables    = {},
          types        = { "bold" },
          properties   = {},
        },
        integrations = {
          alpha            = true,
          bufferline       = true,
          cmp              = true,
          gitsigns         = true,
          nvimtree         = true,
          telescope        = { enabled = true },
          treesitter       = true,
          mason            = true,
          which_key        = true,
          indent_blankline = { enabled = true, colored_indent_levels = true },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors      = { "italic" },
              hints       = { "italic" },
              warnings    = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors      = { "undercurl" },
              hints       = { "undercurl" },
              warnings    = { "undercurl" },
              information = { "undercurl" },
            },
          },
        },
        custom_highlights = function(C)
          return {
            -- ╔══════════════════════════════════════════════════╗
            -- ║  YAML / Kubernetes / Helm — the DevOps priority ║
            -- ╚══════════════════════════════════════════════════╝

            -- Keys (apiVersion, kind, metadata, spec) — vivid cyan, bold
            ["@property.yaml"]      = { fg = "#7dcfff", bold = true },
            ["@field.yaml"]         = { fg = "#7dcfff", bold = true },
            ["@label.yaml"]         = { fg = "#7dcfff", bold = true },
            ["yamlBlockMappingKey"]  = { fg = "#7dcfff", bold = true },
            ["yamlKey"]             = { fg = "#7dcfff", bold = true },

            -- YAML plain scalar values (e.g. HelmChart, kube-system) — soft peach
            ["@string.yaml"]        = { fg = "#ffc777" },
            ["yamlPlainScalar"]     = { fg = "#ffc777" },
            ["yamlFlowString"]      = { fg = "#c3e88d" },

            -- YAML block scalars (|- and |) — bright gold
            ["yamlBlockScalarHeader"] = { fg = "#ff9e64", bold = true },
            ["@punctuation.special.yaml"] = { fg = "#ff9e64", bold = true },

            -- YAML anchors & aliases (&anchor, *alias) — magenta
            ["yamlAnchor"]          = { fg = "#c099ff", bold = true },
            ["yamlAlias"]           = { fg = "#c099ff", italic = true },

            -- YAML tags (!tag) — rose
            ["yamlTag"]             = { fg = "#fca7ea" },
            ["yamlNodeTag"]         = { fg = "#fca7ea" },

            -- YAML colons and dashes — subtle gold
            ["yamlKeyValueDelimiter"] = { fg = "#e0af68" },
            ["yamlBlockCollectionItemStart"] = { fg = "#e0af68", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Strings — different shades by context           ║
            -- ╚══════════════════════════════════════════════════╝
            ["@string"]             = { fg = "#c3e88d" },       -- warm green
            ["String"]              = { fg = "#c3e88d" },
            ["@string.special"]     = { fg = "#ffc777" },       -- special strings = gold
            ["@string.escape"]      = { fg = "#ff966c", bold = true },  -- escape sequences = orange
            ["@string.regex"]       = { fg = "#b4f9f8" },       -- regex = aqua
            ["@string.special.url"] = { fg = "#73daca", underline = true }, -- URLs = teal + underline

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Numbers, Booleans, Null — distinct warm tones   ║
            -- ╚══════════════════════════════════════════════════╝
            ["@number"]             = { fg = "#ff9e64", bold = true },  -- orange
            ["Number"]              = { fg = "#ff9e64", bold = true },
            ["@float"]              = { fg = "#ff9e64" },
            ["Float"]               = { fg = "#ff9e64" },
            ["@boolean"]            = { fg = "#ff007c", bold = true },  -- hot pink
            ["Boolean"]             = { fg = "#ff007c", bold = true },
            ["@constant.builtin"]   = { fg = "#fca7ea", italic = true }, -- null/nil/None = pink

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Comments — softer but readable                  ║
            -- ╚══════════════════════════════════════════════════╝
            ["@comment"]            = { fg = "#636da6", italic = true },
            ["Comment"]             = { fg = "#636da6", italic = true },
            ["@comment.todo"]       = { fg = "#1a1b26", bg = "#e0af68", bold = true },
            ["@comment.note"]       = { fg = "#1a1b26", bg = "#7dcfff", bold = true },
            ["@comment.warning"]    = { fg = "#1a1b26", bg = "#ff966c", bold = true },
            ["@comment.error"]      = { fg = "#1a1b26", bg = "#f7768e", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Keywords, Control flow — purple family           ║
            -- ╚══════════════════════════════════════════════════╝
            ["@keyword"]            = { fg = "#bb9af7", italic = true },
            ["Keyword"]             = { fg = "#bb9af7", italic = true },
            ["@keyword.return"]     = { fg = "#c099ff", bold = true, italic = true },
            ["@keyword.import"]     = { fg = "#7dcfff", italic = true },
            ["@keyword.operator"]   = { fg = "#89ddff" },
            ["@conditional"]        = { fg = "#bb9af7", bold = true, italic = true },
            ["@repeat"]             = { fg = "#bb9af7", bold = true, italic = true },
            ["@exception"]          = { fg = "#f7768e", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Functions & Methods — blue family                ║
            -- ╚══════════════════════════════════════════════════╝
            ["@function"]           = { fg = "#82aaff", bold = true },
            ["Function"]            = { fg = "#82aaff", bold = true },
            ["@function.call"]      = { fg = "#82aaff" },
            ["@function.builtin"]   = { fg = "#7dcfff", bold = true },
            ["@method"]             = { fg = "#82aaff" },
            ["@method.call"]        = { fg = "#82aaff" },
            ["@constructor"]        = { fg = "#ffc777", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Types & Classes — teal / aqua                    ║
            -- ╚══════════════════════════════════════════════════╝
            ["@type"]               = { fg = "#2ac3de", bold = true },
            ["Type"]                = { fg = "#2ac3de", bold = true },
            ["@type.builtin"]       = { fg = "#2ac3de", italic = true },
            ["@type.qualifier"]     = { fg = "#bb9af7", italic = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Variables & Parameters                           ║
            -- ╚══════════════════════════════════════════════════╝
            ["@variable"]           = { fg = "#c0caf5" },
            ["Identifier"]          = { fg = "#c0caf5" },
            ["@variable.builtin"]   = { fg = "#f7768e", italic = true },  -- self/this = rose
            ["@parameter"]          = { fg = "#e0af68", italic = true },  -- params = gold italic

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Properties & Fields — soft teal                  ║
            -- ╚══════════════════════════════════════════════════╝
            ["@property"]           = { fg = "#73daca" },
            ["@field"]              = { fg = "#73daca" },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Operators & Punctuation — carefully tinted       ║
            -- ╚══════════════════════════════════════════════════╝
            ["@operator"]           = { fg = "#89ddff" },        -- sky blue operators
            ["Operator"]            = { fg = "#89ddff" },
            ["@punctuation.bracket"]     = { fg = "#a9b1d6" },
            ["@punctuation.delimiter"]   = { fg = "#89ddff" },   -- : ; , = sky blue
            ["@punctuation.special"]     = { fg = "#ff9e64", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Tags (HTML/XML/YAML) — rose + gold attributes    ║
            -- ╚══════════════════════════════════════════════════╝
            ["@tag"]                = { fg = "#f7768e", bold = true },
            ["@tag.attribute"]      = { fg = "#e0af68", italic = true },
            ["@tag.delimiter"]      = { fg = "#636da6" },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Namespaces, Modules, Constants                   ║
            -- ╚══════════════════════════════════════════════════╝
            ["@namespace"]          = { fg = "#ffc777", italic = true },
            ["@constant"]           = { fg = "#ff9e64" },
            ["Constant"]            = { fg = "#ff9e64" },
            ["@define"]             = { fg = "#82aaff", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Terraform / HCL                                  ║
            -- ╚══════════════════════════════════════════════════╝
            ["@keyword.hcl"]        = { fg = "#bb9af7", bold = true },
            ["@property.hcl"]       = { fg = "#73daca" },
            ["@string.hcl"]         = { fg = "#c3e88d" },
            ["@type.hcl"]           = { fg = "#2ac3de", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Docker                                           ║
            -- ╚══════════════════════════════════════════════════╝
            ["@keyword.dockerfile"] = { fg = "#82aaff", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  JSON keys                                        ║
            -- ╚══════════════════════════════════════════════════╝
            ["@property.json"]      = { fg = "#7dcfff", bold = true },
            ["@label.json"]         = { fg = "#7dcfff", bold = true },
            ["@property.jsonc"]     = { fg = "#7dcfff", bold = true },
            ["@string.json"]        = { fg = "#c3e88d" },
            ["@number.json"]        = { fg = "#ff9e64", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Shell / Bash                                     ║
            -- ╚══════════════════════════════════════════════════╝
            ["@variable.bash"]         = { fg = "#e0af68" },
            ["@string.special.bash"]   = { fg = "#ffc777" },
            ["@punctuation.special.bash"] = { fg = "#ff9e64", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  Markdown — rich headings                         ║
            -- ╚══════════════════════════════════════════════════╝
            ["@markup.heading.1"]   = { fg = "#f7768e", bold = true },
            ["@markup.heading.2"]   = { fg = "#ff9e64", bold = true },
            ["@markup.heading.3"]   = { fg = "#e0af68", bold = true },
            ["@markup.heading.4"]   = { fg = "#73daca", bold = true },
            ["@markup.heading.5"]   = { fg = "#82aaff", bold = true },
            ["@markup.heading.6"]   = { fg = "#bb9af7", bold = true },
            ["@markup.heading"]     = { fg = "#82aaff", bold = true },
            ["@markup.link"]        = { fg = "#73daca", underline = true },
            ["@markup.link.url"]    = { fg = "#73daca", underline = true, italic = true },
            ["@markup.strong"]      = { fg = "#c0caf5", bold = true },
            ["@markup.italic"]      = { fg = "#c0caf5", italic = true },
            ["@markup.raw"]         = { fg = "#c3e88d", bg = "#1e2030" },
            ["@markup.list"]        = { fg = "#89ddff", bold = true },

            -- ╔══════════════════════════════════════════════════╗
            -- ║  UI Elements — polished editor look               ║
            -- ╚══════════════════════════════════════════════════╝

            -- Line numbers
            LineNr         = { fg = "#3b4261" },
            CursorLineNr   = { fg = "#ff9e64", bold = true },
            CursorLine     = { bg = "#292e42" },

            -- Visual selection
            Visual          = { bg = "#2d3f76" },
            VisualNOS       = { bg = "#2d3f76" },

            -- Search
            Search          = { fg = "#1a1b26", bg = "#e0af68", bold = true },
            IncSearch       = { fg = "#1a1b26", bg = "#ff9e64", bold = true },
            CurSearch       = { fg = "#1a1b26", bg = "#ffc777", bold = true },
            Substitute      = { fg = "#1a1b26", bg = "#f7768e", bold = true },

            -- Matching parens
            MatchParen      = { fg = "#ffc777", bg = "#3b4261", bold = true },

            -- Popup menus (completion, etc.)
            Pmenu           = { fg = "#c0caf5", bg = "#1e2030" },
            PmenuSel        = { fg = "#1a1b26", bg = "#7dcfff", bold = true },
            PmenuSbar       = { bg = "#24283b" },
            PmenuThumb      = { bg = "#3b4261" },

            -- Float windows
            NormalFloat     = { fg = "#c0caf5", bg = "#1e2030" },
            FloatBorder     = { fg = "#3b4261", bg = "#1e2030" },
            FloatTitle      = { fg = "#7dcfff", bg = "#1e2030", bold = true },

            -- Window separators
            WinSeparator    = { fg = "#3b4261" },

            -- Indent guides
            IblIndent       = { fg = "#24283b" },
            IblScope        = { fg = "#3b4261" },

            -- Diagnostics
            DiagnosticError           = { fg = "#f7768e" },
            DiagnosticWarn            = { fg = "#e0af68" },
            DiagnosticInfo            = { fg = "#7dcfff" },
            DiagnosticHint            = { fg = "#73daca" },
            DiagnosticVirtualTextError = { fg = "#f7768e", bg = "#2d202a", italic = true },
            DiagnosticVirtualTextWarn  = { fg = "#e0af68", bg = "#2d2920", italic = true },
            DiagnosticVirtualTextInfo  = { fg = "#7dcfff", bg = "#1e2a3a", italic = true },
            DiagnosticVirtualTextHint  = { fg = "#73daca", bg = "#1e2d2d", italic = true },

            -- Telescope
            TelescopeTitle          = { fg = "#7dcfff", bold = true },
            TelescopeBorder         = { fg = "#3b4261" },
            TelescopePromptBorder   = { fg = "#ff9e64" },
            TelescopePromptTitle    = { fg = "#ff9e64", bold = true },
            TelescopeResultsTitle   = { fg = "#73daca", bold = true },
            TelescopePreviewTitle   = { fg = "#bb9af7", bold = true },
            TelescopeSelection      = { fg = "#c0caf5", bg = "#2d3f76", bold = true },
            TelescopeMatching       = { fg = "#ffc777", bold = true },

            -- Which-key
            WhichKey          = { fg = "#7dcfff" },
            WhichKeyGroup     = { fg = "#bb9af7", italic = true },
            WhichKeySeparator = { fg = "#3b4261" },
            WhichKeyDesc      = { fg = "#a9b1d6" },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
