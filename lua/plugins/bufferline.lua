return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				mode = "buffers", -- show tabs as buffers
				numbers = "none", -- or "ordinal" to number them
				diagnostics = "nvim_lsp", -- lsp diagnostics
				diagnostics_update_in_insert = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "slant", -- "slant" | "padded_slant" | "thick" | "thin"
				always_show_bufferline = true,
				color_icons = true,

				-- Highlight current buffer
				highlights = {
					buffer_selected = {
						bold = true,
						italic = false,
					},
				},

				-- Beautiful diagnostic symbols
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or level:match("warning") and " " or " "
					return " " .. icon .. count
				end,

				-- Offset so Explorer doesn’t look squished
				offsets = {
					{
						filetype = "NvimTree",
						text = "  File Explorer",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
				},

				-- Custom icons for modified/close/pinned
				modified_icon = "●",
				buffer_close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
			},
		})

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts) -- next buffer
		map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts) -- prev buffer
		map("n", "<leader>bp", ":BufferLinePick<CR>", opts) -- pick buffer
		map("n", "<leader>bd", ":bd<CR>", opts) -- close buffer
		map("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts) -- close all to left
		map("n", "<leader>br", ":BufferLineCloseRight<CR>", opts) -- close all to right
	end,
}
