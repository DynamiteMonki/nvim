local M = {}

M.servers = {
    "lua_ls",
    "pyright",
    "gopls",
    "clangd" 
}

M.formatters = {
    "stylua",
    "goimports",
    "clang-format"
}

M.linters = {
    "ruff"
}

return M 
