-- ============================================================
-- Core Neovim Options — DevOps-friendly defaults
-- ============================================================
local opt = vim.opt

-- Line numbers
opt.number         = true
opt.relativenumber = true
opt.signcolumn     = "yes"

-- Indentation (2-space, expand tabs)
opt.tabstop     = 2
opt.shiftwidth  = 2
opt.softtabstop = 2
opt.expandtab   = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase  = true
opt.hlsearch   = true
opt.incsearch  = true

-- Appearance
opt.termguicolors = true
opt.cursorline    = true
opt.scrolloff     = 8
opt.sidescrolloff = 8
opt.wrap          = false
opt.showmode      = false  -- lualine shows the mode

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Performance
opt.updatetime  = 250
opt.timeoutlen  = 300
opt.undofile    = true
opt.swapfile    = false

-- Clipboard (use system clipboard)
opt.clipboard = "unnamedplus"

-- Completion menu
opt.completeopt = { "menu", "menuone", "noselect" }

-- File encoding
opt.fileencoding = "utf-8"

-- Leader key (space)
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
