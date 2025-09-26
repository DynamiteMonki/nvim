return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter" },
      layout = {
        width = 30,
        min_width = 20,
      },
      show_guides = true,
    })

    -- Toggle outline window
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>", { noremap = true, silent = true })
  end,
}
