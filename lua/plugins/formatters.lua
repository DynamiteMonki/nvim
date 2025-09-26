local devtools = require("settings.devtools")

return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    -- join formatters + linters into one list
    local ensure_installed = {}
    for _, item in ipairs(devtools.formatters) do
      table.insert(ensure_installed, item)
    end
    for _, item in ipairs(devtools.linters) do
      table.insert(ensure_installed, item)
    end

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed,
      auto_update = true,
      run_on_start = true,
    })
  end,
}
