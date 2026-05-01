-- Neovim Configuration

-- Leader keys must be set before lazy.nvim loads, so plugin specs that
-- reference <leader> resolve correctly.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw before any plugin loads, since nvim-tree replaces it.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  rocks = {
    enabled = false,
  },
})

require("config.options")
require("config.keymaps")
