-- Strongly recommended: disable netrw before enabling nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "node_modules", ".venv" }, -- folders to hide
  },
  git = {
    enable = true,
  },
})

