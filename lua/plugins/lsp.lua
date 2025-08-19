return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      mason_lspconfig.setup()

      -- Instead of setup_handlers, do manual setup to avoid errors:
      local installed_servers = mason_lspconfig.get_installed_servers()
      for _, server_name in ipairs(installed_servers) do
        lspconfig[server_name].setup({})
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
}

