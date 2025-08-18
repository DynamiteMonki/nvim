return {
  {
    "romgrk/barbar.nvim",
    version = "^1.0.0",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim"
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      sidebar_filetypes = {
        -- Display "File Explorer" when NvimTree is open
        NvimTree = true
      }
    }
  }
}

