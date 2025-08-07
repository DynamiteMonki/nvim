local cmp = require'cmp'
cmp.setup({
  sources = {
    { name = 'nvim_lsp' }, -- LSP support
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },  -- optional, for snippets
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(), -- trigger completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- more keybindings as you like...
  }),
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
  end,
})

