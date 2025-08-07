require("mason-lspconfig").setup({
  ensure_installed = { "gopls", "html", "cssls", "lua_ls" },
  handlers = { 
    function (server)
      require("lspconfig")[server].setup({})
    end,
    ["lua_ls"] = function ()
      require("lspconfig").lua_ls.setup{
        settings = { 
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      }
    end,
  },
})
