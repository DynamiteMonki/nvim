return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",     -- for code context (functions, classes)
    "nvim-tree/nvim-web-devicons", -- optional icons
  },
  config = function()
    require("barbecue").setup({
      theme = "auto", -- follow your colorscheme automatically
      attach_navic = true, -- show current function/class via LSP
      create_autocmd = true, -- auto update winbar
      show_dirname = true,   -- show parent dirs
      show_basename = true,  -- show file name
      show_modified = true,  -- [*] indicator
    })
  end,
}
