-- In ~/.config/nvim/lua/plugins/colorscheme.lua (or whatever modules you use)
return {
  {
    "dasupradyumna/midnight.nvim",
    priority = 1000,       -- Load before other plugins
    lazy = false,          -- Load eagerly to avoid issues
    config = function()
      vim.cmd.colorscheme 'midnight'
    end,
  },
}

