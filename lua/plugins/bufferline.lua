return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers", -- show tabs as buffers
				numbers = "none",
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "slant",
				always_show_bufferline = true,
				color_icons = true,

				-- Highlight current buffer
				highlights = {
					buffer_selected = {
						bold = true,
						italic = false,
					},
				},

				-- Diagnostic symbols
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or level:match("warning") and " " or " "
					return " " .. icon .. count
				end,

				-- Offsets so tree sidebars don’t squish bufferline
				offsets = {
					{
						filetype = "neo-tree",
						text = "  File Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
					{
						filetype = "NvimTree", -- optional: if you sometimes use NvimTree
						text = "  File Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
				},

				-- Custom icons
				modified_icon = "●",
				buffer_close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
			},
		})

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
		map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
		map("n", "<leader>bp", ":BufferLinePick<CR>", opts)
		map("n", "<leader>bd", ":bd<CR>", opts)
		map("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts)
		map("n", "<leader>br", ":BufferLineCloseRight<CR>", opts)
		map("n", "<leader>q", ":bdelete<CR>", opts)
	end,
}
