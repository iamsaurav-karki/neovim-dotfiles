-- ============================================================
-- Plugin: LSP — language servers for DevOps workflows
-- Uses vim.lsp.config (Neovim 0.11+) — NO require('lspconfig')
-- ============================================================
return {
  -- Mason: portable package manager for LSP servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- Ensure these tools are installed via Mason
      local ensure_installed = {
        -- LSP servers
        "terraform-ls",
        "tflint",
        "yaml-language-server",
        "dockerfile-language-server",
        "docker-compose-language-service",
        "groovy-language-server",
        "bash-language-server",
        "pyright",
        "json-lsp",
        "marksman",
        "lua-language-server",
        "ansible-language-server",
      }

      local mr = require("mason-registry")
      mr.refresh(function()
        for _, tool in ipairs(ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },

  -- nvim-lspconfig — provides server config definitions for vim.lsp.config
  -- We do NOT call require('lspconfig') anywhere
  {
    "neovim/nvim-lspconfig",
    lazy = true, -- loaded by vim.lsp.config internally when needed
  },

  -- SchemaStore — auto-detected JSON/YAML schemas (K8s CRDs, Helm, ArgoCD, etc.)
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- Main LSP setup (runs early)
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- ── Diagnostic config ────────────────────────────────────
      vim.diagnostic.config({
        virtual_text  = { prefix = "●" },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰌵 ",
            [vim.diagnostic.severity.INFO]  = " ",
          },
        },
        update_in_insert = false,
        underline        = true,
        severity_sort    = true,
        float            = { border = "rounded", source = true },
      })

      -- ── LSP keymaps via LspAttach ────────────────────────────
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(ev)
          local function map(key, fn, desc)
            vim.keymap.set("n", key, fn, { buffer = ev.buf, desc = desc })
          end
          map("gd",         vim.lsp.buf.definition,     "Go to definition")
          map("gD",         vim.lsp.buf.declaration,    "Go to declaration")
          map("gi",         vim.lsp.buf.implementation, "Go to implementation")
          map("gr",         vim.lsp.buf.references,     "References")
          map("K",          vim.lsp.buf.hover,          "Hover docs")
          map("<leader>rn", vim.lsp.buf.rename,         "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
          map("<leader>f",  function() vim.lsp.buf.format({ async = true }) end, "Format")
          map("[d",         vim.diagnostic.goto_prev,   "Prev diagnostic")
          map("]d",         vim.diagnostic.goto_next,   "Next diagnostic")
          map("<leader>d",  vim.diagnostic.open_float,  "Float diagnostic")
        end,
      })

      -- ── Server configurations ────────────────────────────────
      -- Global defaults for all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Terraform
      vim.lsp.config("terraformls", {})
      vim.lsp.config("tflint", {})

      -- YAML — with SchemaStore for auto CRD detection
      -- Supports: Kubernetes, Helm, ArgoCD, FluxCD, Kustomize,
      --           GitHub Actions, GitLab CI, Docker Compose, and 500+ more
      local schemastore_ok, schemastore = pcall(require, "schemastore")
      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemaStore = {
              enable = false, -- we use schemastore.nvim instead
              url = "",
            },
            schemas = schemastore_ok and schemastore.yaml.schemas() or {},
            validate   = true,
            completion = true,
            hover      = true,
            format     = { enable = true },
          },
          redhat = { telemetry = { enabled = false } },
        },
      })

      -- Docker
      vim.lsp.config("dockerls", {})
      vim.lsp.config("docker_compose_language_service", {})

      -- Groovy (Jenkinsfile)
      vim.lsp.config("groovyls", {})

      -- Bash / Shell
      vim.lsp.config("bashls", {
        filetypes = { "sh", "bash", "zsh" },
      })

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode       = "basic",
              autoSearchPaths        = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      -- JSON — with SchemaStore
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas  = schemastore_ok and schemastore.json.schemas() or {},
            validate = { enable = true },
          },
        },
      })

      -- Markdown
      vim.lsp.config("marksman", {})

      -- Ansible
      vim.lsp.config("ansiblels", {
        filetypes = { "yaml.ansible" },
      })

      -- Lua (for editing this config)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime     = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace   = {
              library        = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- ── Enable all servers ───────────────────────────────────
      vim.lsp.enable({
        "terraformls",
        "tflint",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "groovyls",
        "bashls",
        "pyright",
        "jsonls",
        "marksman",
        "ansiblels",
        "lua_ls",
      })
    end,
  },
}
