# 🛠️ Neovim Configuration for DevOps Engineers

A modular, Lua-based Neovim configuration tailored for DevOps workflows — Terraform, Kubernetes, Docker, Ansible, Shell scripting, Python, and more.

> **Author:** Saurav Karki

---

## ✨ Features

| Category | Details |
|---|---|
| **Plugin Manager** | [lazy.nvim](https://github.com/folke/lazy.nvim) — auto-bootstraps on first launch |
| **Dashboard** | alpha-nvim start screen with quick actions |
| **Syntax Highlighting** | Treesitter with parsers for HCL, YAML, Dockerfile, Groovy, Bash, Python, JSON, Markdown, Git, Helm |
| **LSP** | Mason + vim.lsp.config (Neovim 0.11+) for `terraformls`, `tflint`, `yamlls`, `dockerls`, `groovyls`, `bashls`, `pyright`, `jsonls`, `marksman`, `lua_ls` |
| **Autocompletion** | nvim-cmp with LSP, buffer, path, cmdline sources + LuaSnip snippets |
| **Snippets** | Custom snippets for Terraform, Bash, Python |
| **Fuzzy Finder** | Telescope (files, live grep, buffers, commands, help, diagnostics, symbols) |
| **Terminal** | toggleterm with VS Code-style `Ctrl+`` ` toggle |
| **Git** | gitsigns with VS Code-style colored indicators (🟢 added, 🔵 modified, 🔴 deleted) |
| **File Explorer** | nvim-tree sidebar |
| **Status Line** | lualine with branch, diff, diagnostics |
| **Colorscheme** | Catppuccin Mocha |
| **Extras** | which-key, indent guides, autopairs, surround, comment, todo-comments, dressing, vim-helm, vim-terraform, ansible-vim |

---

## 📁 Directory Structure

```
dotfiles-nvim/
├── init.lua                          # Entry point
├── lua/
│   └── config/
│       ├── options.lua               # Core Neovim settings
│       ├── keymaps.lua               # General keybindings
│       ├── lazy-bootstrap.lua        # lazy.nvim auto-install & setup
│       ├── snippets.lua              # Custom LuaSnip snippets (TF, Bash, Python)
│       └── plugins/                  # Each file = one lazy.nvim plugin spec
│           ├── dashboard.lua         # alpha-nvim welcome screen
│           ├── treesitter.lua        # Syntax highlighting
│           ├── telescope.lua         # Fuzzy finder
│           ├── lsp.lua               # LSP servers (vim.lsp.config)
│           ├── cmp.lua               # Autocompletion + LuaSnip
│           ├── toggleterm.lua        # Terminal toggle (Ctrl+`)
│           ├── gitsigns.lua          # Git decorations + diff colors
│           ├── colorscheme.lua       # Catppuccin theme
│           ├── lualine.lua           # Status line
│           ├── nvimtree.lua          # File explorer
│           └── extras.lua            # Additional quality-of-life plugins
├── .gitignore
└── README.md
```

---

## 🚀 Installation

### Prerequisites

| Tool | Purpose |
|---|---|
| **Neovim ≥ 0.11** | Required for `vim.lsp.config` API |
| **Git** | Plugin management |
| **[Nerd Font](https://www.nerdfonts.com/)** | Icons everywhere |
| **ripgrep** (`rg`) | Telescope live grep |
| **fd** | Telescope file finder (optional, faster) |
| **Node.js** | Required by some LSP servers |
| **Python 3** | For pyright LSP |

### Quick Start

```bash
# 1. Back up existing config (if any)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# 2. Clone this repo
git clone https://github.com/<your-user>/dotfiles-nvim.git ~/projects/dotfiles-nvim

# 3. Symlink to Neovim config directory
ln -sf ~/projects/dotfiles-nvim ~/.config/nvim

# 4. Open Neovim — everything bootstraps automatically
nvim
```

On first launch, lazy.nvim will:
1. Install itself
2. Install all plugins
3. Treesitter downloads language parsers
4. Mason installs LSP servers automatically

### Installing System Dependencies

```bash
# Ubuntu / Debian
sudo apt install ripgrep fd-find nodejs npm python3 python3-pip

# macOS (Homebrew)
brew install ripgrep fd node python neovim

# Arch Linux
sudo pacman -S ripgrep fd nodejs npm python neovim

# Fedora / RHEL
sudo dnf install ripgrep fd-find nodejs python3
```

---

## 📖 Usage Guide

### First Launch

When you open `nvim` for the first time, you'll see plugin installation progress. Wait for it to complete, then restart Neovim. The **dashboard** will greet you with quick-action buttons.

### Daily Workflow

1. **Open Neovim** → Dashboard appears with quick actions
2. Press `f` to find a file, or `g` to grep across the project
3. **Edit files** → LSP provides autocomplete, diagnostics, hover docs
4. Press `Space + e` to toggle the file explorer sidebar
5. Use `Ctrl + `` ` to toggle an integrated terminal
6. **Git changes** appear as colored markers in the gutter (green/blue/red)
7. Press `Space + h` prefix for git hunk actions (stage, reset, blame)
8. Press `Space + f` prefix for Telescope search actions

### Plugin Management

| Command | Action |
|---|---|
| `:Lazy` | Open lazy.nvim plugin manager UI |
| `:Lazy sync` | Install/update/clean all plugins |
| `:Lazy update` | Update all plugins |
| `:Lazy health` | Check plugin health |
| `:Mason` | Open Mason LSP server manager UI |
| `:MasonUpdate` | Update Mason registry |

### LSP Commands

| Command | Action |
|---|---|
| `:LspInfo` | Show active LSP servers for current buffer |
| `:LspRestart` | Restart LSP servers |
| `:Mason` | Install/manage LSP servers |

### Treesitter Commands

| Command | Action |
|---|---|
| `:TSUpdate` | Update all Treesitter parsers |
| `:TSInstall <lang>` | Install a specific parser |
| `:TSModuleInfo` | Show parser status for all languages |

---

## ⌨️ Complete Key Bindings Reference

> **Leader key: `Space`**
> All `<leader>` bindings below mean pressing `Space` first, then the key(s).

---

### 🏠 Dashboard (Start Screen)

These work only on the dashboard when Neovim opens with no file:

| Key | Action |
|---|---|
| `f` | Find file (Telescope) |
| `r` | Recent files |
| `g` | Grep text (live grep) |
| `e` | New empty file |
| `c` | Open configuration (`init.lua`) |
| `q` | Quit Neovim |

---

### 🔤 General — Normal Mode

| Key | Action | Defined in |
|---|---|---|
| `Space + w` | Save file (`:w`) | `keymaps.lua` |
| `Space + q` | Quit (`:q`) | `keymaps.lua` |
| `Space + Q` | Force quit all (`:qa!`) | `keymaps.lua` |
| `Space + e` | Toggle file explorer (nvim-tree) | `keymaps.lua` |
| `Esc` | Clear search highlight | `keymaps.lua` |

### 🪟 Window Navigation — Normal Mode

| Key | Action | Defined in |
|---|---|---|
| `Ctrl + h` | Move to left window | `keymaps.lua` |
| `Ctrl + j` | Move to window below | `keymaps.lua` |
| `Ctrl + k` | Move to window above | `keymaps.lua` |
| `Ctrl + l` | Move to right window | `keymaps.lua` |
| `Ctrl + ↑` | Decrease window height | `keymaps.lua` |
| `Ctrl + ↓` | Increase window height | `keymaps.lua` |
| `Ctrl + ←` | Decrease window width | `keymaps.lua` |
| `Ctrl + →` | Increase window width | `keymaps.lua` |

### 📄 Buffer Navigation — Normal Mode

| Key | Action | Defined in |
|---|---|---|
| `Shift + L` | Next buffer | `keymaps.lua` |
| `Shift + H` | Previous buffer | `keymaps.lua` |
| `Space + bd` | Delete/close buffer | `keymaps.lua` |

### ✏️ Visual Mode

| Key | Action | Defined in |
|---|---|---|
| `<` | Indent left (stay in visual) | `keymaps.lua` |
| `>` | Indent right (stay in visual) | `keymaps.lua` |
| `J` | Move selected lines down | `keymaps.lua` |
| `K` | Move selected lines up | `keymaps.lua` |

---

### 🔭 Telescope — Fuzzy Finder (Normal Mode)

| Key | Action | Defined in |
|---|---|---|
| `Space + ff` | Find files | `keymaps.lua` |
| `Space + fg` | Live grep (search text in all files) | `keymaps.lua` |
| `Space + fb` | List open buffers | `keymaps.lua` |
| `Space + fh` | Search help tags | `keymaps.lua` |
| `Space + fc` | Search commands | `keymaps.lua` |
| `Space + fr` | Recent files (oldfiles) | `keymaps.lua` |
| `Space + fd` | List all diagnostics | `keymaps.lua` |
| `Space + fs` | Document symbols (LSP) | `keymaps.lua` |

**Inside Telescope picker (Insert Mode):**

| Key | Action | Defined in |
|---|---|---|
| `Ctrl + j` | Move selection down | `telescope.lua` |
| `Ctrl + k` | Move selection up | `telescope.lua` |
| `Ctrl + q` | Send selected to quickfix list | `telescope.lua` |
| `Esc` | Close Telescope | `telescope.lua` |

---

### 🧠 LSP — Language Server (Normal Mode, buffer-local)

These keymaps activate automatically when an LSP server attaches to a buffer:

| Key | Action | Defined in |
|---|---|---|
| `gd` | **Go to definition** | `lsp.lua` |
| `gD` | Go to declaration | `lsp.lua` |
| `gi` | Go to implementation | `lsp.lua` |
| `gr` | Find all references | `lsp.lua` |
| `K` | **Hover documentation** (show docs popup) | `lsp.lua` |
| `Space + rn` | **Rename symbol** (across all files) | `lsp.lua` |
| `Space + ca` | **Code action** (quick fixes, refactors) | `lsp.lua` |
| `Space + f` | **Format** file/selection | `lsp.lua` |
| `Space + d` | Show diagnostic in floating window | `lsp.lua` |
| `[d` | Jump to previous diagnostic | `lsp.lua` |
| `]d` | Jump to next diagnostic | `lsp.lua` |

---

### ✅ Autocompletion — nvim-cmp (Insert Mode)

These work when the completion popup is visible:

| Key | Action | Defined in |
|---|---|---|
| `Tab` | Select next item / expand snippet / jump forward | `cmp.lua` |
| `Shift + Tab` | Select previous item / jump backward in snippet | `cmp.lua` |
| `Enter` | Confirm selection | `cmp.lua` |
| `Ctrl + Space` | Trigger completion manually | `cmp.lua` |
| `Ctrl + e` | Abort/close completion | `cmp.lua` |
| `Ctrl + b` | Scroll docs up | `cmp.lua` |
| `Ctrl + f` | Scroll docs down | `cmp.lua` |

---

### 🌳 Treesitter — Incremental Selection (Normal/Visual Mode)

| Key | Action | Defined in |
|---|---|---|
| `Ctrl + Space` | Start/expand selection (by syntax node) | `treesitter.lua` |
| `Backspace` | Shrink selection (by syntax node) | `treesitter.lua` |

---

### 🖥️ Terminal — toggleterm (All Modes)

| Key | Action | Defined in |
|---|---|---|
| `` Ctrl + ` `` | **Toggle terminal** (open/close) | `toggleterm.lua` |

**Inside terminal (Terminal Mode):**

| Key | Action | Defined in |
|---|---|---|
| `Esc` | Switch to Normal mode (inside terminal) | `toggleterm.lua` |
| `Ctrl + h` | Navigate to left window | `toggleterm.lua` |
| `Ctrl + j` | Navigate to window below | `toggleterm.lua` |
| `Ctrl + k` | Navigate to window above | `toggleterm.lua` |
| `Ctrl + l` | Navigate to right window | `toggleterm.lua` |

---

### 🔀 Git — gitsigns (Normal Mode, buffer-local)

**Navigation:**

| Key | Action | Defined in |
|---|---|---|
| `]c` | Jump to next changed hunk | `gitsigns.lua` |
| `[c` | Jump to previous changed hunk | `gitsigns.lua` |

**Hunk Actions:**

| Key | Mode | Action | Defined in |
|---|---|---|---|
| `Space + hs` | Normal | Stage hunk | `gitsigns.lua` |
| `Space + hs` | Visual | Stage selected lines | `gitsigns.lua` |
| `Space + hr` | Normal | Reset hunk | `gitsigns.lua` |
| `Space + hr` | Visual | Reset selected lines | `gitsigns.lua` |
| `Space + hS` | Normal | Stage entire buffer | `gitsigns.lua` |
| `Space + hu` | Normal | Undo last stage hunk | `gitsigns.lua` |
| `Space + hR` | Normal | Reset entire buffer | `gitsigns.lua` |
| `Space + hp` | Normal | Preview hunk in popup | `gitsigns.lua` |
| `Space + hb` | Normal | Show full blame for line | `gitsigns.lua` |
| `Space + hd` | Normal | Diff this file | `gitsigns.lua` |
| `Space + hD` | Normal | Diff against previous commit (`~`) | `gitsigns.lua` |
| `Space + ht` | Normal | Toggle showing deleted lines inline | `gitsigns.lua` |

**Git Gutter Colors (VS Code style):**

| Color | Meaning |
|---|---|
| 🟢 Green `▎` | Lines added |
| 🔵 Blue `▎` | Lines modified |
| 🔴 Red `` | Lines deleted |
| Gray italic (EOL) | Blame annotation — author, time, commit message |

---

### 📝 Snippets — LuaSnip (Insert Mode)

Type the prefix, then press `Tab` to expand. Use `Tab` / `Shift+Tab` to jump between placeholders.

#### Terraform / HCL Snippets

| Prefix | Expands to |
|---|---|
| `res` | `resource "type" "name" { ... }` |
| `var` | `variable "name" { description, type, default }` |
| `out` | `output "name" { description, value }` |
| `mod` | `module "name" { source, version, ... }` |
| `data` | `data "type" "name" { ... }` |
| `prov` | `provider "aws" { region = "..." }` |
| `backend` | `terraform { backend "s3" { bucket, key, region } }` |

#### Bash / Shell Snippets

| Prefix | Expands to |
|---|---|
| `shebang` | `#!/usr/bin/env bash` + `set -euo pipefail` |
| `if` | `if [[ condition ]]; then ... fi` |
| `for` | `for item in array; do ... done` |
| `func` | `function_name() { local arg=... }` |
| `while` | `while condition; do ... done` |
| `case` | `case "$1" in pattern) ... esac` |
| `log` | Timestamped log function |

#### Python Snippets

| Prefix | Expands to |
|---|---|
| `main` | `def main(): ...` + `if __name__ == "__main__"` |
| `def` | Function with type hints and docstring |
| `class` | Class with docstring and `__init__` |
| `ifmain` | `if __name__ == "__main__": main()` |
| `try` | `try: ... except Exception as e: ...` |
| `argparse` | argparse boilerplate |
| `log` | logging module setup |

---

### 🧩 Extra Plugin Keybindings

These come from plugins in `extras.lua`:

#### Comment.nvim

| Key | Mode | Action |
|---|---|---|
| `gcc` | Normal | Toggle line comment |
| `gc` | Visual | Toggle comment on selection |
| `gbc` | Normal | Toggle block comment |

#### nvim-surround

| Key | Mode | Action |
|---|---|---|
| `ys{motion}{char}` | Normal | Add surround (e.g., `ysiw"` to surround word with `"`) |
| `ds{char}` | Normal | Delete surround (e.g., `ds"` to remove surrounding `"`) |
| `cs{old}{new}` | Normal | Change surround (e.g., `cs"'` to change `"` to `'`) |
| `S{char}` | Visual | Surround selection |

#### which-key

| Key | Action |
|---|---|
| *(any partial key sequence)* | After a short delay, shows a popup listing all available continuations |

#### nvim-tree (File Explorer)

| Key | Action |
|---|---|
| `Space + e` | Toggle file explorer |
| `Enter` | Open file / expand folder |
| `a` | Create new file |
| `d` | Delete file |
| `r` | Rename file |
| `c` | Copy file |
| `p` | Paste file |
| `y` | Copy filename |

---

## 🗂️ Supported LSP Servers

| Server | Language / Tool | Auto-installed |
|---|---|---|
| `terraformls` | Terraform / HCL | ✅ |
| `tflint` | Terraform linter | ✅ |
| `yamlls` | YAML (K8s, Helm, GitHub Actions) | ✅ |
| `dockerls` | Dockerfile | ✅ |
| `docker_compose_language_service` | Docker Compose | ✅ |
| `groovyls` | Groovy / Jenkinsfile | ✅ |
| `bashls` | Bash / Shell scripts | ✅ |
| `pyright` | Python | ✅ |
| `jsonls` | JSON / JSONC | ✅ |
| `marksman` | Markdown | ✅ |
| `lua_ls` | Lua (for this config) | ✅ |

---

## 🔧 Customization

| Task | How |
|---|---|
| **Add a plugin** | Create a new `.lua` file in `lua/config/plugins/` returning a lazy.nvim spec |
| **Add an LSP server** | Edit `lsp.lua` → add to `ensure_installed`, add `vim.lsp.config()`, add to `vim.lsp.enable()` |
| **Add snippets** | Edit `lua/config/snippets.lua` |
| **Change colorscheme** | Edit `lua/config/plugins/colorscheme.lua` |
| **Change keymaps** | Edit `keymaps.lua` (general) or the respective plugin file (plugin-specific) |
| **Change options** | Edit `lua/config/options.lua` |

---

## 📄 License

MIT — Use freely, modify as you wish.
