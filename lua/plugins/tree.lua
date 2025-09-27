return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- file icons
		"MunifTanjim/nui.nvim", -- UI components
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- closes if it's the last window
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = { enabled = true },
				group_empty_dirs = true,
				hijack_netrw_behavior = "open_default",
			},

			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
				},
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "",
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},

			window = {
				width = 32,
				position = "left",
				mappings = {
					["<cr>"] = "open_drop", -- open in current window (drop-in style)
					["l"] = "open_drop", -- also allow 'l'
					["h"] = "close_node",
				},
			},

			event_handlers = {
				{
					event = "file_opened",
					handler = function(_)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

		-- Toggle file explorer (silent, no command-line spam)
		vim.keymap.set(
			"n",
			"<leader>e",
			":Neotree toggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle Explorer" }
		)
	end,
}
