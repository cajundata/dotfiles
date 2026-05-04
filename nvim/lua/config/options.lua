-- ~/.config/nvim/lua/config/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Color / display
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Note: syntax enable and filetype on are handled by Treesitter and
-- Neovim defaults respectively. Keeping them off here avoids double-work.

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Editing ergonomics
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.confirm = true

-- Indentation defaults
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- UI
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false

-- Better completion menu behavior
vim.opt.completeopt = { "menu", "menuone", "noselect" }