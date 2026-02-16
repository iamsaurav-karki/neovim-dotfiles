-- ============================================================
-- Extra DevOps plugins + filetype detection for Linux/DevOps
-- ============================================================
return {
  -- Auto-detect indent style
  { "tpope/vim-sleuth" },

  -- Surround text objects
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    config  = true,
  },

  -- Auto-close brackets / pairs
  {
    "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = true,
  },

  -- Comment toggling (gcc / gc in visual)
  {
    "numToStr/Comment.nvim",
    event  = { "BufReadPost", "BufNewFile" },
    config = true,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main  = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope  = { enabled = true },
      })
    end,
  },

  -- Better UI for vim.ui.select / vim.ui.input
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Highlight TODO / FIXME / HACK comments
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  -- Which-key: shows pending keybinds in a popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        plugins = { spelling = { enabled = true } },
      })
    end,
  },

  -- ── DevOps language plugins ──────────────────────────────

  -- Helm chart template highlighting
  {
    "towolf/vim-helm",
    ft = "helm",
  },

  -- Better Dockerfile syntax
  { "ekalinin/Dockerfile.vim" },

  -- Terraform formatting + doc integration
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "hcl" },
    config = function()
      vim.g.terraform_fmt_on_save = 1
      vim.g.terraform_align       = 1
    end,
  },

  -- Ansible support
  {
    "pearofducks/ansible-vim",
    ft = { "yaml", "yaml.ansible" },
  },

  -- Nginx syntax highlighting
  {
    "chr4/nginx.vim",
    ft = "nginx",
  },

  -- Tmux config syntax
  {
    "tmux-plugins/vim-tmux",
    ft = "tmux",
  },

  -- Salt / SLS files
  {
    "saltstack/salt-vim",
    ft = { "sls" },
  },

  -- ── Filetype detection for DevOps / Linux files ──────────
  {
    "nathom/filetype.nvim",
    lazy  = false,
    priority = 100,
    config = function()
      -- This plugin improves filetype detection.
      -- We also add custom autocmds below for specific files.
    end,
  },

  -- Custom filetype detection (runs very early)
  {
    dir = ".", -- dummy: just a config-only spec
    name = "devops-filetypes",
    lazy = false,
    priority = 200,
    config = function()
      vim.filetype.add({
        -- By exact filename
        filename = {
          ["Jenkinsfile"]      = "groovy",
          ["Vagrantfile"]      = "ruby",
          ["Caddyfile"]        = "caddyfile",
          ["Procfile"]         = "procfile",
          ["Brewfile"]         = "ruby",
          ["Gemfile"]          = "ruby",
          ["Rakefile"]         = "ruby",
          ["Guardfile"]        = "ruby",
          ["Berksfile"]        = "ruby",
          ["Puppetfile"]       = "ruby",
          ["Containerfile"]    = "dockerfile",
          ["Dockerfile.dev"]   = "dockerfile",
          ["Dockerfile.prod"]  = "dockerfile",
          ["docker-compose.yml"]  = "yaml.docker-compose",
          ["docker-compose.yaml"] = "yaml.docker-compose",
          ["compose.yml"]      = "yaml.docker-compose",
          ["compose.yaml"]     = "yaml.docker-compose",
          [".env"]             = "sh",
          [".env.local"]       = "sh",
          [".env.production"]  = "sh",
          [".env.development"] = "sh",
          [".env.staging"]     = "sh",
          [".env.example"]     = "sh",
          [".envrc"]           = "sh",
          [".bashrc"]          = "bash",
          [".bash_profile"]    = "bash",
          [".bash_aliases"]    = "bash",
          [".zshrc"]           = "zsh",
          [".zshenv"]          = "zsh",
          [".zprofile"]        = "zsh",
          [".tmux.conf"]       = "tmux",
          [".gitconfig"]       = "gitconfig",
          [".gitmodules"]      = "gitconfig",
          [".gitattributes"]   = "gitattributes",
          [".editorconfig"]    = "editorconfig",
          [".prettierrc"]      = "json",
          [".eslintrc"]        = "json",
          [".babelrc"]         = "json",
          [".hadolint.yaml"]   = "yaml",
          [".yamllint"]        = "yaml",
          [".yamllint.yml"]    = "yaml",
          [".ansible-lint"]    = "yaml",
          [".pre-commit-config.yaml"] = "yaml",
          ["requirements.txt"] = "requirements",
          ["constraints.txt"]  = "requirements",
          ["Makefile"]         = "make",
          ["makefile"]         = "make",
          ["GNUmakefile"]      = "make",
          ["Justfile"]         = "just",
          ["justfile"]         = "just",
          ["Taskfile.yml"]     = "yaml",
          ["Taskfile.yaml"]    = "yaml",
          ["Chart.yaml"]       = "yaml",
          ["Chart.yml"]        = "yaml",
          ["values.yaml"]      = "helm",
          ["helmfile.yaml"]    = "yaml",
          ["kustomization.yaml"]  = "yaml",
          ["kustomization.yml"]   = "yaml",
          ["skaffold.yaml"]    = "yaml",
          ["Tiltfile"]         = "starlark",
          ["BUILD"]            = "starlark",
          ["BUILD.bazel"]      = "starlark",
          ["WORKSPACE"]        = "starlark",
          ["WORKSPACE.bazel"]  = "starlark",
          [".fluxcd.yaml"]     = "yaml",
        },

        -- By file extension
        extension = {
          tf       = "terraform",
          tfvars   = "terraform",
          hcl      = "hcl",
          tfstate  = "json",

          yml      = "yaml",
          yaml     = "yaml",

          conf     = "conf",
          cfg      = "conf",
          cnf      = "conf",
          ini      = "ini",
          env      = "sh",

          service  = "systemd",
          timer    = "systemd",
          socket   = "systemd",
          target   = "systemd",
          path     = "systemd",
          mount    = "systemd",
          automount = "systemd",
          swap     = "systemd",
          slice    = "systemd",

          pkla     = "conf",
          rules    = "udevrules",
          link     = "systemd",
          netdev   = "systemd",
          network  = "systemd",

          pp       = "puppet",
          sls      = "sls",

          j2       = "jinja2",
          jinja    = "jinja2",
          jinja2   = "jinja2",

          bats     = "bash",

          groovy   = "groovy",
          gradle   = "groovy",
          gvy      = "groovy",

          proto    = "proto",
          pem      = "pem",
          crt      = "pem",
          key      = "pem",
          pub      = "ssh_config",

          toml     = "toml",
          lock     = "toml",   -- Cargo.lock, poetry.lock

          nix      = "nix",

          csv      = "csv",
          tsv      = "csv",

          sql      = "sql",

          nginx    = "nginx",

          Dockerfile = "dockerfile",
        },

        -- By pattern (glob-like)
        pattern = {
          -- Ansible
          [".*/playbooks/.*.yml"]   = "yaml.ansible",
          [".*/playbooks/.*.yaml"]  = "yaml.ansible",
          [".*/roles/.*/tasks/.*.yml"]  = "yaml.ansible",
          [".*/roles/.*/tasks/.*.yaml"] = "yaml.ansible",
          [".*/roles/.*/handlers/.*.yml"]  = "yaml.ansible",
          [".*/roles/.*/handlers/.*.yaml"] = "yaml.ansible",
          [".*/roles/.*/defaults/.*.yml"]  = "yaml.ansible",
          [".*/roles/.*/defaults/.*.yaml"] = "yaml.ansible",
          [".*/roles/.*/vars/.*.yml"]  = "yaml.ansible",
          [".*/roles/.*/vars/.*.yaml"] = "yaml.ansible",
          [".*/group_vars/.*"]     = "yaml.ansible",
          [".*/host_vars/.*"]      = "yaml.ansible",
          [".*/inventory/.*.yml"]  = "yaml.ansible",
          [".*/inventory/.*.yaml"] = "yaml.ansible",

          -- Kubernetes manifests
          [".*/k8s/.*.yaml"]      = "yaml",
          [".*/k8s/.*.yml"]       = "yaml",
          [".*/kubernetes/.*.yaml"] = "yaml",
          [".*/kubernetes/.*.yml"]  = "yaml",
          [".*/manifests/.*.yaml"]  = "yaml",
          [".*/manifests/.*.yml"]   = "yaml",
          [".*/deploy/.*.yaml"]    = "yaml",
          [".*/deploy/.*.yml"]     = "yaml",

          -- Helm
          [".*/templates/.*.yaml"]  = "helm",
          [".*/templates/.*.yml"]   = "helm",
          [".*/templates/.*.tpl"]   = "helm",

          -- CI/CD pipelines
          [".*/.github/workflows/.*.yml"]  = "yaml",
          [".*/.github/workflows/.*.yaml"] = "yaml",
          [".*/.gitlab%-ci.yml"]    = "yaml",
          [".*/%.circleci/config.yml"] = "yaml",
          ["Jenkinsfile.*"]        = "groovy",

          -- Dockerfiles with variants
          ["Dockerfile.*"]         = "dockerfile",
          [".*%.dockerfile"]       = "dockerfile",

          -- Nginx
          [".*/nginx/.*.conf"]     = "nginx",
          [".*/nginx/.*%.conf%..*"] = "nginx",
          ["/etc/nginx/.*"]        = "nginx",

          -- Apache
          [".*/apache2?/.*.conf"]  = "apache",
          ["/etc/apache2?/.*"]     = "apache",
          [".*.htaccess"]          = "apache",

          -- Systemd
          ["/etc/systemd/.*"]      = "systemd",
          ["/usr/lib/systemd/.*"]  = "systemd",

          -- SSH
          [".*/%.ssh/config.*"]    = "sshconfig",
          ["/etc/ssh/sshd_config.*"] = "sshdconfig",

          -- Env files
          [".*%.env%..*"]          = "sh",

          -- Cron
            ["/etc/cron%.d/.*"]      = "crontab",
            ["/etc/cron%..*"]        = "crontab",
          },
        })
      end,
    },

    -- ── Rainbow delimiters — colorful nested brackets ────────
    {
      "HiPhish/rainbow-delimiters.nvim",
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        local rainbow = require("rainbow-delimiters")
        vim.g.rainbow_delimiters = {
          strategy = {
            [""]  = rainbow.strategy["global"],
            vim   = rainbow.strategy["local"],
          },
          query = {
            [""]  = "rainbow-delimiters",
            lua   = "rainbow-blocks",
          },
          highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        }
        -- Custom rainbow colors matching our theme
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed",    { fg = "#f7768e" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#e0af68" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ff9e64" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen",  { fg = "#73daca" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#bb9af7" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",   { fg = "#7dcfff" })
      end,
    },

    -- ── Colorizer — show hex color previews inline ───────────
    {
      "norcalli/nvim-colorizer.lua",
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        require("colorizer").setup({
          "*",
          css  = { css = true },
          html = { names = true },
        }, {
          mode = "background",
        })
      end,
    },
}