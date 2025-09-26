return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "none",
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "thin",
        always_show_bufferline = true,

        -- Offset so Explorer doesn’t steal a buffer slot
        offsets = {
          {
            filetype = "NvimTree",
            text = "Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    })

    -- Keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts) -- next buffer
    map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts) -- prev buffer
    map("n", "<leader>bp", ":BufferLinePick<CR>", opts) -- pick buffer
    map("n", "<leader>bd", ":bd<CR>", opts)             -- close buffer
  end,
}
