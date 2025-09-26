local devtools = require("settings.devtools")

return {
  "stevearc/conform.nvim",
  event = "BufWritePre", -- auto-load before saving file
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt", "goimports-reviser" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        -- Add more mappings here if needed
      },
      -- Run LSP formatting as a fallback
      fallback_lsp_format = true,
    })

    -- Keymap: manual format on demand
    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format file" })
  end,
}
