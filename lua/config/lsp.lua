require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end,
        ["lua_ls"] = function ()
          require("config.lua_ls")
        end
    },
})
