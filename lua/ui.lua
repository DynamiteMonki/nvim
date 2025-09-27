-- ui.lua
-- Simple UI setup for Neovim: dark, pastel, minimal notifications

-- ### Colorscheme ###
-- Using tokyonight: deep dark backgrounds + pastel highlights
vim.cmd([[colorscheme tokyonight-storm]])

-- ### Transparency / Subtle Tweaks ###
-- Optional: remove background in some areas for a sleeker look
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE
]])

-- ### Notifications ###
-- Minimal, pleasant notifications using nvim-notify
local ok, notify = pcall(require, "notify")
if ok then
	notify.setup({
		background_colour = "#000000", -- true black behind notification
		render = "minimal", -- minimal popup design
		stages = "fade_in_slide_out", -- smooth animation
		timeout = 2000, -- fade after 2s (not too pushy)
	})
	vim.notify = notify
end

-- ### Optional UI niceties ###
-- You can later integrate: lualine (statusline), noice (command UI).
-- Keeping it light for now, since "simple setup" was the request.
