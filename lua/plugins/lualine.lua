return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- pretty icons
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight", -- deep dark w/ pastel highlights
				icons_enabled = true,
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" }, -- smooth powerline curves
				always_divide_middle = true,
				globalstatus = true, -- one statusline across your whole Vim window
			},
			sections = {
				lualine_a = {
					{ "mode", icon = "", right_padding = 2 },
				},
				lualine_b = {
					{ "branch", icon = "" },
					{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
				},
				lualine_c = {
					{
						"filename",
						file_status = true, -- [Read Only] or [+] for modified
						path = 1, -- relative path, 0 = just filename
						shorting_target = 40,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " " },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", icon = "" }, -- cursor location
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
