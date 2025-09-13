-- Basic Neovim options
local opt = vim.opt
local g = vim.g

-- Set leader key
g.mapleader = " "
g.maplocalleader = " "

-- Nerd Font support
g.have_nerd_font = true

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Cursor line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Turn off swapfile and backup
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Undo settings
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Update time
opt.updatetime = 50

-- Scroll settings
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Better completion experience
opt.completeopt = "menuone,noselect"

-- Mouse support
opt.mouse = "a"

-- Show hidden characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Performance
opt.lazyredraw = false
opt.timeoutlen = 500  -- Increased for Which-key

-- Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

-- GUI font (for Neovide or GUI Neovim)
opt.guifont = "JetBrainsMono Nerd Font:h14"

-- Disable netrw (we're using nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1