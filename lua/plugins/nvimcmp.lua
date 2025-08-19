return {
  -- nvim-cmp core
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load on insert mode
    dependencies = {
      -- LSP source for nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
      -- buffer words source
      "hrsh7th/cmp-buffer",
      -- path source
      "hrsh7th/cmp-path",
      -- snippet source
      "saadparwaiz1/cmp_luasnip",
      -- Snippet engine
      "L3MON4D3/LuaSnip",
    },
  },
}

