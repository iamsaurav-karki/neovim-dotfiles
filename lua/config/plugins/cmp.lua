-- ============================================================
-- Plugin: nvim-cmp — autocompletion + LuaSnip snippets
-- ============================================================
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP source
      "hrsh7th/cmp-buffer",       -- buffer words
      "hrsh7th/cmp-path",         -- file paths
      "hrsh7th/cmp-cmdline",      -- cmdline completion
      "saadparwaiz1/cmp_luasnip", -- snippet source
      -- Snippet engine
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          -- Load VS Code-style snippets from friendly-snippets
          require("luasnip.loaders.from_vscode").lazy_load()
          -- Load custom snippets from our config
          require("config.snippets")
        end,
      },
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      -- Kind icons (VS Code style)
      local kind_icons = {
        Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "",
        Field = "󰜢", Variable = "󰀫", Class = "󰠱", Interface = "",
        Module = "", Property = "󰜢", Unit = "󰑭", Value = "󰎠",
        Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
        File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "",
        Constant = "󰏿", Struct = "󰙅", Event = "", Operator = "󰆕",
        TypeParameter = "",
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
          ["<C-f>"]     = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          -- Tab / Shift-Tab for snippet navigation
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip  = "[Snip]",
              buffer   = "[Buf]",
              path     = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Cmdline completion for `/` search
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })

      -- Cmdline completion for `:` commands
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = "path" } },
          { { name = "cmdline" } }
        ),
      })
    end,
  },
}
