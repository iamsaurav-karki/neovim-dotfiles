-- ============================================================
-- Plugin: Treesitter — syntax highlighting for ALL DevOps formats
-- ============================================================
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter",
    opts = {
      ensure_installed = {
        -- ── DevOps core ────────────────────────────────
        "hcl",               -- Terraform / HCL
        "terraform",         -- Terraform specific
        "yaml",              -- YAML (K8s, Helm, Ansible, CI/CD)
        "dockerfile",        -- Dockerfiles
        "groovy",            -- Jenkinsfile / Groovy
        "bash",              -- Shell scripts
        "python",            -- Python automation
        "json",              -- JSON configs
        "jsonc",             -- JSON with comments

        -- ── Kubernetes / Cloud Native ──────────────────
        "helm",              -- Helm chart templates
        "starlark",          -- Bazel BUILD files

        -- ── Markup / Documentation ─────────────────────
        "markdown",          -- README, docs
        "markdown_inline",   -- Inline markdown

        -- ── Git ────────────────────────────────────────
        "gitcommit",
        "gitignore",
        "git_rebase",
        "git_config",        -- .gitconfig, .gitmodules
        "diff",              -- Diff/patch files

        -- ── Config file formats ────────────────────────
        "toml",              -- pyproject.toml, Cargo.toml, etc.
        "ini",               -- .ini, .cfg, .conf files
        "ssh_config",        -- ~/.ssh/config
        "nginx",             -- nginx.conf
        "xml",               -- XML configs, Maven POM
        "csv",               -- CSV data files
        "tmux",              -- tmux.conf
        "properties",        -- Java .properties files

        -- ── Programming extras ─────────────────────────
        "lua",               -- Neovim config
        "vim",               -- Vimscript
        "vimdoc",            -- Vim help files
        "regex",             -- Regular expressions
        "jq",                -- jq filter expressions
        "sql",               -- SQL queries
        "make",              -- Makefiles
        "cmake",             -- CMake
        "proto",             -- Protocol Buffers
        "go",                -- Go (many DevOps tools in Go)
        "ruby",              -- Vagrantfile, Puppet, Chef
        "java",              -- Groovy/Java interop

        -- ── Data formats ───────────────────────────────
        "html",              -- HTML templates
        "css",               -- CSS
        "javascript",        -- JS (Node tools, configs)
        "typescript",        -- TS configs
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection    = "<C-space>",
          node_incremental  = "<C-space>",
          scope_incremental = false,
          node_decremental  = "<BS>",
        },
      },
    },
  },
}
