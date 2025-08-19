M =  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,    -- Automatically close if it’s the last window
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = { padding = 1 },
          icon = { folder_closed = "", folder_open = "" },
          modified = { symbol = "[+]" },
        },
        window = {
          width = 30,
          mappings = {
            ["o"] = "open",
            ["h"] = "close_node",
            ["v"] = "open_vsplit",
          },
        },
      })
    end,
  }

  return M
