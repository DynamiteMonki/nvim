-- Simple formatting utilities
-- Additional keybinds and utilities for formatting

local M = {}

-- Setup additional formatting keybinds
function M.setup()
	-- Toggle auto-formatting (this will disable conform's format_on_save)
	vim.keymap.set("n", "<leader>tf", function()
		local conform = require("conform")
		local current_setting = conform.format_on_save ~= nil
		
		if current_setting then
			-- Disable format on save
			conform.format_on_save = nil
			vim.notify("Auto-formatting disabled", vim.log.levels.INFO)
		else
			-- Enable format on save with default settings
			conform.format_on_save = function(bufnr)
				local enable_filetypes = { "lua", "python", "javascript", "typescript", "json", "yaml", "go" }
				if vim.tbl_contains(enable_filetypes, vim.bo[bufnr].filetype) then
					return {
						timeout_ms = 3000,
						lsp_fallback = true,
					}
				end
			end
			vim.notify("Auto-formatting enabled", vim.log.levels.INFO)
		end
	end, { desc = "Toggle auto-formatting" })

end

return M
