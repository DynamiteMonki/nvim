-- Core Neovim options (minimal + best-of essentials)

local opt = vim.opt

-- Line numbers
opt.number = true -- show absolute line number
opt.relativenumber = true -- show relative line numbers

-- Indentation
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 4 -- indentation width
opt.tabstop = 4 -- how many columns a tab counts for
opt.smartindent = true -- smart autoindenting

-- Searching
opt.ignorecase = true -- ignore case when searching...
opt.smartcase = true -- ...unless uppercase letters are used

-- UI
opt.termguicolors = true -- enable 24-bit RGB color
opt.cursorline = true -- highlight current line
opt.signcolumn = "yes" -- always show sign column (for git/gutter/lsp warnings)

-- Behavior
opt.clipboard = "unnamedplus" -- use system clipboard
opt.undofile = true -- persistent undo
opt.swapfile = false -- don’t litter with swap files

-- Convenience
opt.scrolloff = 8 -- minimal lines to keep above/below cursor
opt.wrap = false -- don’t wrap long lines

vim.opt.colorcolumn = "80" -- soft edge marker at 80 chars
