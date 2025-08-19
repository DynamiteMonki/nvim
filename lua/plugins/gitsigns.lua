return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { hl = "GitGutterAdd",    text = "┃" },
          change       = { hl = "GitGutterChange", text = "┃" },
          delete       = { hl = "GitGutterDelete", text = "┃" },
          topdelete    = { hl = "GitGutterDelete", text = "┃" },
          changedelete = { hl = "GitGutterChange", text = "┃" },
        },
        numhl = false,         -- Disable number column highlighting
        linehl = false,        -- Disable line highlighting
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        current_line_blame = false, -- Toggle inline blame info with gs
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
      })
    end,
  },
}

