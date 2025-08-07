vim.opt.termguicolors = true 
require("bufferline").setup{
  options = {
    separator_style = "slant",
    show_close_icon = false,
    show_buffer_close_icons = true,
    always_show_bufferline = true,
    color_icons = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    },
    indicator = {
      icon = "▎",
      style = "icon"
    },
  }
}
