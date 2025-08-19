local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    prompt_prefix = "🔍 ",
  }
}

local opts = { noremap = true, silent = true }

-- Key mappings for Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
vim.api.nvim_set_keymap('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

