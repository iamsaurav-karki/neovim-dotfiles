-- ============================================================
-- Keymaps — General & LSP
-- ============================================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ── General ─────────────────────────────────────────────────
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
map("n", "<C-Up>",    ":resize -2<CR>",          opts)
map("n", "<C-Down>",  ":resize +2<CR>",          opts)
map("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation (VS Code-style tabs)
map("n", "<S-l>",      ":BufferLineCycleNext<CR>",          opts)   -- next tab
map("n", "<S-h>",      ":BufferLineCyclePrev<CR>",          opts)   -- prev tab
map("n", "<Tab>",      ":BufferLineCycleNext<CR>",          opts)   -- Tab = next tab
map("n", "<S-Tab>",    ":BufferLineCyclePrev<CR>",          opts)   -- Shift+Tab = prev tab
map("n", "<leader>bd", ":Bdelete<CR>",                      opts)   -- close tab (keep layout)
map("n", "<leader>bo", ":BufferLineCloseOthers<CR>",        opts)   -- close all other tabs
map("n", "<leader>bl", ":BufferLineCloseRight<CR>",         opts)   -- close tabs to the right
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>",          opts)   -- close tabs to the left
map("n", "<leader>bp", ":BufferLineTogglePin<CR>",          opts)   -- pin/unpin tab
map("n", "<leader>bs", ":BufferLineSortByDirectory<CR>",    opts)   -- sort tabs by directory
map("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>",       opts)   -- jump to tab 1
map("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>",       opts)   -- jump to tab 2
map("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>",       opts)   -- jump to tab 3
map("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>",       opts)   -- jump to tab 4
map("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>",       opts)   -- jump to tab 5
map("n", "<A-Right>",  ":BufferLineMoveNext<CR>",           opts)   -- move tab right
map("n", "<A-Left>",   ":BufferLineMovePrev<CR>",           opts)   -- move tab left

-- Clear search highlight
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Stay in visual mode when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Save / Quit shortcuts
map("n", "<leader>w", ":w<CR>",  opts)
map("n", "<leader>q", ":q<CR>",  opts)
map("n", "<leader>Q", ":qa!<CR>", opts)

-- File explorer toggle
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- ── Telescope ───────────────────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",   { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",   { desc = "Help tags" })
map("n", "<leader>fc", "<cmd>Telescope commands<CR>",    { desc = "Commands" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",    { desc = "Recent files" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })

-- ── LSP (attached via on_attach in lsp.lua) ─────────────────
-- These are set buffer-locally in lsp.lua on_attach.
-- Listed here for documentation:
--   gd        → go-to definition
--   gD        → go-to declaration
--   gi        → go-to implementation
--   gr        → references
--   K         → hover documentation
--   <leader>rn → rename
--   <leader>ca → code action
--   <leader>f  → format
--   [d / ]d   → previous / next diagnostic
--   <leader>d  → float diagnostic

-- ── Git (gitsigns keymaps set in gitsigns.lua) ──────────────
-- ]c / [c  → next / prev hunk
-- <leader>hs → stage hunk
-- <leader>hr → reset hunk
-- <leader>hp → preview hunk
-- <leader>hb → blame line
