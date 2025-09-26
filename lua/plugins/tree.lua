return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for folder/file icons

  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        relativenumber = true,
      },
      renderer = {
        highlight_git = true,
        root_folder_label = false,
      },
      filters = {
        dotfiles = false, -- set true if you want to hide dotfiles
      },
      actions = {
        open_file = {
          quit_on_open = true, -- close tree when you open a file
        },
      },
      git = {
        enable = true,
      },
    })

    -- Keymaps for file explorer
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Toggle tree
    map("n", "<leader>e", ":NvimTreeToggle<CR>", opts) 
  end,
}
