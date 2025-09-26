return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {
        gitsigns = true,
        treesitter = true,
        cmp = true,
        telescope = true,
        which_key = true,
        bufferline = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
