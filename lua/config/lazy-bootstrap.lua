-- ============================================================
-- Bootstrap lazy.nvim — auto-installs on first run
-- ============================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Load plugin specs from config.plugins
require("lazy").setup("config.plugins", {
  defaults = { lazy = false },
  install  = { colorscheme = { "catppuccin", "habamax" } },
  checker  = { enabled = true, notify = false },
  change_detection = { notify = false },
})
