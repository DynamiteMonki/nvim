return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },

  config = function()
    require("treesitter-context").setup({
      enable = true,            -- enable the plugin
      max_lines = 3,            -- how many lines of context to show
      trim_scope = "outer",     -- hide outer context lines when max_lines is exceeded
      mode = "cursor",          -- calculate context based on cursor position
      multiline_threshold = 20, -- collapse context if it spans too many lines
      separator = "─",          -- a line separator between context and code ("" for none)
    })
  end,
}
