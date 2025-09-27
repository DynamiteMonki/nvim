return {
	"windwp/nvim-autopairs",
	event = "InsertEnter", -- load only when you start typing
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- use Treesitter to be smart about pairing
			disable_filetype = { "TelescopePrompt", "vim" }, -- don't interfere in these
		})
	end,
}
