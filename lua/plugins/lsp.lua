return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts ={ 
      automatic_installation = true,
      automatic_enable = true,
    },},
  },
}
