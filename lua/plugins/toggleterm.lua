return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15,
      direction = "horizontal",
      persist_size = true,
      start_in_insert = true,
    })

    -- Only in Normal mode
    vim.keymap.set("n", "<leader>h", "<cmd>ToggleTerm direction=horizontal<CR>", { silent = true, desc = "Horizontal Terminal" })
    vim.keymap.set("n", "<leader>v", "<cmd>ToggleTerm direction=vertical size=50<CR>", { silent = true, desc = "Vertical Terminal" })
    vim.keymap.set("n", "<leader>f", "<cmd>ToggleTerm direction=float<CR>", { silent = true, desc = "Floating Terminal" })
  end,
}
