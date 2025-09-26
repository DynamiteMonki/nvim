-- Keymaps setup

-- Set <Space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clipboard mappings
map("n", "<leader>y", '"+y', opts)      -- copy (yank) to system clipboard
map("v", "<leader>y", '"+y', opts)      -- copy selection to system clipboard
map("n", "<leader>p", '"+p', opts)      -- paste from system clipboard
map("v", "<leader>p", '"+p', opts)      -- paste in visual mode from system clipboard

-- Small quality-of-life goodness (minimal extras)
map("n", "<leader>w", ":w<CR>", opts)   -- quick save
map("n", "<leader>q", ":q<CR>", opts)   -- quick quit
map("n", "<leader>h", ":nohlsearch<CR>", opts) -- clear search highlights

