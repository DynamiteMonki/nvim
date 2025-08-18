return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 30,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      git = {enable = true},
      filters = {dotfiles = false},
    })

    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle", {desc = "Toggle NvimTree"})
  end,
}
