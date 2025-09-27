return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"gopls",
					"rust_analyzer",
					"ruby_lsp",
					"cssls",
					"ts_ls",
					"html",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {
				filetypes = { "lua" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.config("pyright", {
				filetypes = "py",
			})
			vim.lsp.config("clangd", {
				filetypes = { "c", "cpp" },
			})
			vim.lsp.config("gopls", {})
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.config("ruby_lsp", {})
			vim.lsp.config("cssls", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("html", {})

			-- Keybindings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
