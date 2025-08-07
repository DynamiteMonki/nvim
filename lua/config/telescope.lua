-- Telescope configuration is now handled in the plugin file
-- Additional telescope keybindings
local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = true }

-- File navigation
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = "Telescope recent files" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Telescope commands" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Telescope keymaps" })

-- Git integration (telescope)
vim.keymap.set('n', '<leader>gS', builtin.git_status, { desc = "Telescope git status" })
vim.keymap.set('n', '<leader>gC', builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set('n', '<leader>gB', builtin.git_branches, { desc = "Telescope git branches" })

-- LSP integration
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = "Telescope LSP references" })
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = "Telescope LSP definitions" })
vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, { desc = "Telescope LSP symbols" })
vim.keymap.set('n', '<leader>lw', builtin.lsp_workspace_symbols, { desc = "Telescope LSP workspace symbols" })

-- Search in current buffer
vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = "Telescope search in buffer" })
