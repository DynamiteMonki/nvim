-- Example options: line numbers, tabs, clipboard, leader
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.g.mapleader = ' '

-- Enable some mini.nvim modules
require('mini.basics').setup()        -- Basic, sensible defaults
require('mini.completion').setup()    -- Completion
require('mini.files').setup()         -- File explorer
require('mini.pick').setup()          -- Fuzzy finder
require('mini.comment').setup()       -- "gc" for commenting
require('mini.statusline').setup()    -- Minimal statusline

-- Example keymaps for file explorer and fuzzy finder (Pick)
vim.keymap.set('n', '<leader>e', "<cmd>lua MiniFiles.open()<cr>", {desc = "File explorer"})
vim.keymap.set('n', '<leader>ff', "<cmd>Pick files<cr>", {desc = "Pick files"})
vim.keymap.set('n', '<leader><space>', "<cmd>Pick buffers<cr>", {desc = "Pick buffers"})

