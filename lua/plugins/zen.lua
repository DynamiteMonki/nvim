return {
	"folke/zen-mode.nvim",
	dependencies = { "folke/twilight.nvim" }, -- optional: dims inactive code
	keys = {
		{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
	},
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.9, -- dim non-editor background (0 is fully transparent)
				width = 100, -- width of the Zen window (can be % or absolute number)
				options = {
					signcolumn = "no", -- hide signcolumn
					number = false, -- hide line numbers
					relativenumber = false,
					cursorline = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false, -- disable ruler text in command line
					showcmd = false, -- disable command feedback
				},
				twilight = { enabled = true }, -- dim inactive code (super nice in Zen)
				gitsigns = { enabled = false },
				tmux = { enabled = false },
			},
		})
	end,
}
