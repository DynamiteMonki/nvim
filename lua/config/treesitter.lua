require('nvim-treesitter.configs').setup {
  -- List the languages you want parsers for, or use "all"
  ensure_installed = {
    "lua", "vim", "vimdoc", "javascript", "typescript", "python", "go",
    "html", "css", "json", "yaml", "markdown", "bash"
  },

  sync_install = false,        -- Install parsers asynchronously
  auto_install = true,         -- Automatically install missing parsers

  highlight = {
    enable = true,                         -- Enable Treesitter-based highlighting
    additional_vim_regex_highlighting = false, -- Fallback to regex for unsupported parts (set true only if needed)
  },

  indent = { enable = true },              -- Enable Treesitter-based indentation

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
    },
  },
}

