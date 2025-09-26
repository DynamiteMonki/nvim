return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│", -- simple thin line for guides
      highlight = "Whitespace",
    },
    scope = {
      enabled = false, -- don't highlight the current scope (keeps it minimal)
    },
    exclude = {
      filetypes = {
        "help",
        "terminal",
        "dashboard",
        "NvimTree",
        "Trouble",
        "lazy",
      },
    },
  },
}
