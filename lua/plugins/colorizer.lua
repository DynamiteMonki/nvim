return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" }, -- load only when opening files
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css",
        "scss",
        "html",
        "javascript",
        "typescript",
        "lua",
        "vim",
        "markdown",
      },
      user_default_options = {
        RGB      = true,  -- #RGB
        RRGGBB   = true,  -- #RRGGBB
        names    = true,  -- "red", "blue", etc.
        RRGGBBAA = true,  -- #RRGGBBAA
        rgb_fn   = true,  -- rgb() and rgba()
        hsl_fn   = true,  -- hsl() and hsla()
        css      = true,  -- enable all CSS features: rgb_fn, hsl_fn, names
      },
    })
  end,
}
