-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save / quit
map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>quit!<cr>", { desc = "Force quit window" })

-- Source config quickly while editing nvim config
map("n", "<leader>so", "<cmd>source %<cr>", { desc = "Source current file" })

-- Clear search highlighting
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- File explorer using built-in netrw
map("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Open file explorer" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", opts)
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", opts)
map("n", "<A-j>", "<cmd>resize -2<cr>", opts)
map("n", "<A-k>", "<cmd>resize +2<cr>", opts)

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<cr>gv=gv", opts)
map("v", "K", ":m '<-2<cr>gv=gv", opts)

-- Keep cursor centered while moving through search results
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Terminal mode escape
map("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Treesitter helpers (work once Treesitter is loaded)
map("n", "<leader>ti", "<cmd>InspectTree<cr>", { desc = "Inspect syntax tree" })
map("n", "<leader>tI", "<cmd>Inspect<cr>",     { desc = "Inspect highlight under cursor" })
map("n", "<leader>tu", "<cmd>TSUpdate<cr>",    { desc = "Update Treesitter parsers" })