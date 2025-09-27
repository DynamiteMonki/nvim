return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- 🔥 ASCII Banner (Neovim logo style)
		dashboard.section.header.val = {
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
		}

		-- ✨ Shortcuts with icons
		dashboard.section.buttons.val = {
			dashboard.button("e", "   New File", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱼   Find File", ":Telescope find_files<CR>"),
			dashboard.button("r", "   Recent Files", ":Telescope oldfiles<CR>"),
			dashboard.button("p", "󰱼   Find Project", ":Telescope projects<CR>"),
			dashboard.button("c", "   Config", ":e $MYVIMRC<CR>"),
			dashboard.button("q", "󰩈   Quit Neovim", ":qa<CR>"),
		}

		-- 🚫 Keep footer empty (ultra clean)
		dashboard.section.footer.val = {}

		-- Highlight groups: pastel aesthetic
		dashboard.section.header.opts.hl = "Function"
		dashboard.section.buttons.opts.hl = "Keyword"

		alpha.setup(dashboard.opts)
	end,
}
