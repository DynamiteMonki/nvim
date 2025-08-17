local telescope_builtins = require('telescope.builtin')

-- Find files
vim.keymap.set("n", "<leader>ff", telescope_builtins.find_files, { desc = "Find files" })

-- Live Grep
vim.keymap.set("n", "<leader>fg", telescope_builtins.live_grep, { desc = "Grep text" })

-- Buffers
vim.keymap.set("n", "<leader>fb", telescope_builtins.buffers, { desc = "List open buffers" })

-- Help tags
vim.keymap.set("n", "<leader>fh", telescope_builtins.help_tags, { desc = "Help tags" })

-- Recent files
vim.keymap.set("n", "<leader>fr", telescope_builtins.oldfiles, { desc = "Recent files" })

-- Git branches
vim.keymap.set("n", "<leader>gb", telescope_builtins.git_branches, { desc = "Git branches" })

