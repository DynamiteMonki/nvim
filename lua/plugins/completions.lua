return {
  "Saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
      border = "rounded",            -- rounded popups
      highlight = "PmenuSel",        -- use theme selection highlight
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
    },
    ghost_text = {enabled = true},
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    formatting = {
      format = function(item, vim_item)
        local lspkind = require("lspkind")
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        return vim_item
      end,
    },
  },
  opts_extend = { "sources.default" },
}
