return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('neo-tree').setup({})

      vim.keymap.set('n', '<C-n>', function()
        require('neo-tree.command').execute({ toggle = true })
      end, { desc = 'Toggle Neo-tree' })
    end,
  },
}

