return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- LSP completions
    "hrsh7th/cmp-buffer",     -- buffer words
    "hrsh7th/cmp-path",       -- filesystem paths
    "hrsh7th/cmp-nvim-lua",   -- Neovim Lua API completions
    "onsails/lspkind.nvim",   -- elegant completion item labels
  },

  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- show symbol + text (clean, compact)
          preset = "default",
          maxwidth = 50,
          ellipsis_char = "...", -- truncate if too long
        }),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter = accept
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
      }),
      experimental = {
        ghost_text = true, -- faded inline hints (modern feel)
      },
    })

    -- Make the completion popup blend with the theme (nice & subtle)
    vim.o.pumblend = 12
  end,
}
