-- Modern formatting and linting setup using conform.nvim and nvim-lint
return {
	-- Formatting with conform.nvim
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("conform").setup({
				-- Define formatters by filetype
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					go = { "goimports", "gofumpt" },
					c = { "clang_format" },
					cpp = { "clang_format" },
					ruby = { "rubocop" },
					sh = { "shfmt" },
					bash = { "shfmt" },
					zsh = { "shfmt" },
					sql = { "sql_formatter" },
				},

				-- Custom formatter configurations
				formatters = {
					stylua = {
						args = { "--indent-type", "Tabs", "--indent-width", "4", "-" },
					},
					black = {
						args = { "--line-length", "88", "--quiet", "-" },
					},
					isort = {
						args = { "--profile", "black", "--quiet", "-" },
					},
					prettier = {
						args = { "--single-quote", "--trailing-comma", "es5", "--stdin-filepath", "$FILENAME" },
					},
					shfmt = {
						args = { "-i", "2", "-ci" },
					},
					clang_format = {
						args = { "--style=file" },
					},
				},

				-- Format on save configuration
				format_on_save = function(bufnr)
					-- Disable format-on-save for specific filetypes
					local disable_filetypes = { "sql", "java" }
					if vim.tbl_contains(disable_filetypes, vim.bo[bufnr].filetype) then
						return
					end

					-- Enable for specific filetypes only
					local enable_filetypes = { "lua", "python", "javascript", "typescript", "json", "yaml", "go" }
					if vim.tbl_contains(enable_filetypes, vim.bo[bufnr].filetype) then
						return {
							timeout_ms = 3000,
							lsp_fallback = true,
						}
					end
				end,

				-- Log level
				log_level = vim.log.levels.WARN,
			})

			-- Keymaps for formatting
			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				require("conform").format({
					async = true,
					timeout_ms = 3000,
					lsp_fallback = true,
				})
			end, { desc = "Format buffer" })

			-- Format info command
			vim.keymap.set("n", "<leader>fi", function()
				require("conform").format({ dry_run = true })
			end, { desc = "Show format info" })
		end,
	},

	-- Linting with nvim-lint
	{
		"mfussenegger/nvim-lint",
		dependencies = { "mason.nvim" },
		config = function()
			local lint = require("lint")

			-- Configure linters by filetype
			lint.linters_by_ft = {
				python = { "flake8", "mypy" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				go = { "golangcilint" },
				ruby = { "rubocop" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				zsh = { "shellcheck" },
				json = { "jsonlint" },
				yaml = { "yamllint" },
				markdown = { "markdownlint" },
			}

			-- Custom linter configurations
			lint.linters.flake8.args = {
				"--max-line-length=88",
				"--extend-ignore=E203,W503",
				"--format=%(path)s:%(row)d:%(col)d: %(code)s %(text)s",
				"-",
			}

			lint.linters.mypy.args = {
				"--show-column-numbers",
				"--show-error-end",
				"--hide-error-context",
				"--no-color-output",
				"--no-error-summary",
				"--no-pretty",
			}

			-- Auto-lint on specific events
			local lint_augroup = vim.api.nvim_create_augroup("Lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			-- Manual lint command
			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting" })
		end,
	},

	-- Mason integration for tool management
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Formatters
					"stylua",
					"black",
					"isort",
					"prettier",
					"goimports",
					"gofumpt",
					"clang-format",
					"rubocop",
					"shfmt",
					"sql-formatter",

					-- Linters
					"flake8",
					"mypy",
					"eslint_d",
					"golangci-lint",
					"shellcheck",
					"jsonlint",
					"yamllint",
					"markdownlint",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
