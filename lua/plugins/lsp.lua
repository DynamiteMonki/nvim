local devtools = require("settings.devtools")

return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = devtools.servers,
        automatic_installation = false,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Go To Definition")
        map("n", "gr", vim.lsp.buf.references, "Find References")
        map("n", "K", vim.lsp.buf.hover, "Hover Doc")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
      end

      for _, server in ipairs(devtools.servers) do
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
        }

        if server == "lua_ls" then
          opts.settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          }
        end

        vim.lsp.config[server] = opts
        vim.lsp.enable(server)
      end
    end,
  },
}
