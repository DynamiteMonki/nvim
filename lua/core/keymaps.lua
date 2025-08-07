local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode --
-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize splits using arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Insert mode --
-- Fast escape from insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual mode --
-- Indent and remain selected
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)
-- Move selected lines up or down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- Paste over selection without yanking
keymap("v", "p", '"_dP', opts)

-- Visual Block mode --
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)


-- Nvim-tree setup
keymap("n", "<C-n>", ':NvimTreeToggle<CR>', opts)

vim.api.nvim_set_keymap("n", "<C-LeftMouse>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Git operations (Gitsigns)
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", opts)
keymap("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", opts)
keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gN", ":Gitsigns prev_hunk<CR>", opts)

-- Harpoon (Quick file navigation)
keymap("n", "<leader>ha", ":lua require('harpoon'):list():append()<CR>", opts)
keymap("n", "<leader>hm", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", opts)
keymap("n", "<leader>h1", ":lua require('harpoon'):list():select(1)<CR>", opts)
keymap("n", "<leader>h2", ":lua require('harpoon'):list():select(2)<CR>", opts)
keymap("n", "<leader>h3", ":lua require('harpoon'):list():select(3)<CR>", opts)
keymap("n", "<leader>h4", ":lua require('harpoon'):list():select(4)<CR>", opts)

-- Trouble (Diagnostics)
keymap("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", opts)
keymap("n", "<leader>xw", ":Trouble diagnostics toggle filter.buf=0<CR>", opts)
keymap("n", "<leader>xl", ":Trouble loclist toggle<CR>", opts)
keymap("n", "<leader>xq", ":Trouble qflist toggle<CR>", opts)

-- Spectre (Search & Replace)
keymap("n", "<leader>S", ":lua require('spectre').open()<CR>", opts)
keymap("n", "<leader>sw", ":lua require('spectre').open_visual({select_word=true})<CR>", opts)
keymap("n", "<leader>sp", ":lua require('spectre').open_file_search({select_word=true})<CR>", opts)

-- Format code
keymap("n", "<leader>f", ":lua require('conform').format({ lsp_fallback = true })<CR>", opts)
keymap("v", "<leader>f", ":lua require('conform').format({ lsp_fallback = true })<CR>", opts)

-- Session management (Persistence)
keymap("n", "<leader>qs", ":lua require('persistence').load()<CR>", opts)
keymap("n", "<leader>ql", ":lua require('persistence').load({ last = true })<CR>", opts)
keymap("n", "<leader>qd", ":lua require('persistence').stop()<CR>", opts)

