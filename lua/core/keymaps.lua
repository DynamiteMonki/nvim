local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- Save file 
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<C-n>", ":Neotree toggle<CR>", opts)

-- Stage hunk
keymap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)

-- Reset hunk
keymap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)

-- Preview hunk
keymap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)

-- Toggle current line blame
keymap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opts)
