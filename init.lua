--[[
  Neovim Configuration for DevOps Engineers
  Modular Lua-based config with lazy.nvim
  -------------------------------------------
  Symlink this directory to ~/.config/nvim
    ln -sf /path/to/dotfiles-nvim ~/.config/nvim
  Then open Neovim — lazy.nvim bootstraps automatically.
]]

-- 1. Core settings (before plugins)
require("config.options")
require("config.keymaps")

-- 2. Bootstrap lazy.nvim & load plugins
require("config.lazy-bootstrap")
