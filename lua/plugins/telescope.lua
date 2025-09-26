return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    telescope.setup({
      defaults = {
        prompt_prefix = "> ",    -- clean, no fancy glyphs
        selection_caret = "> ",  -- simple arrow
        path_display = { "smart" },
      },
    })

    -- Keymaps
    map("n", "<leader>ff", builtin.find_files, opts) -- search files
    map("n", "<leader>fg", builtin.live_grep, opts)  -- search text in files
    map("n", "<leader>fb", builtin.buffers, opts)    -- search open buffers
    map("n", "<leader>fh", builtin.help_tags, opts)  -- search help
  end,
}
