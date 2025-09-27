return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- currently only Stylua
					null_ls.builtins.diagnostics.rubocop, -- ruby lsp
					null_ls.builtins.formatting.rubocop, -- ruby format
					null_ls.builtins.formatting.prettier, -- Js, TS
					null_ls.builtins.formatting.black, -- Python sytax
					null_ls.builtins.formatting.isort, -- Python imports
				},
			})

			-- Format on demand for ANY filetype with available formatter(s)
			vim.keymap.set("n", "<leader>gf", function()
				vim.lsp.buf.format({ async = false })
			end, { desc = "Format buffer with LSP/none-ls" })

			-- Optional: auto-format ALL files on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}
