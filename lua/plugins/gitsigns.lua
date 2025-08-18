return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },
        signcolumn = true,  -- Toggle with ':Gitsigns toggle_signs'
        numhl      = true,  -- Toggle with ':Gitsigns toggle_numhl'
        linehl     = false, -- Toggle with ':Gitsigns toggle_linehl'
        word_diff  = false, -- Toggle with ':Gitsigns toggle_word_diff'
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with ':Gitsigns toggle_current_line_blame'
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 500,
          ignore_whitespace = false,
        },
        preview_config = {
          border = 'single',
        },
        yadm = {
          enable = false
        },
      })
    end
  }
}

