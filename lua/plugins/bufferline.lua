return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
              separator = true,
            },
          },
          show_bufferline = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          separator_style = "slant",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(_, _, diag)
            local s = ""
            if diag.error ~= 0 then s = s .. " " .. diag.error .. " " end
            if diag.warning ~= 0 then s = s .. " " .. diag.warning end
            return s
          end,
        },
      })

      vim.opt.termguicolors = true
    end,
  },
}

