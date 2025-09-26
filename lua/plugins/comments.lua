return {
  "numToStr/Comment.nvim",
  event = "BufReadPre", -- load right before editing a buffer
  config = function()
    require("Comment").setup({
      -- Optional extra polish
      ignore = "^$",       -- ignores empty lines
      mappings = {
        basic = true,      -- enable normal gcc/gc keymaps
        extra = true,      -- enable g> / g< etc.
      },
    })

    -- Custom leader keymaps (optional, ergonomic)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Toggle comment in normal mode
    map("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, opts)

    -- Toggle comment in visual mode
    map("v", "<leader>/", function()
      local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
      vim.api.nvim_feedkeys(esc, 'nx', false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, opts)
  end,
}
