return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")


    -- Register keybinding groups
    wk.register({
      ["<leader>f"] = {
        name = "Find/File",
        f = "Find files",
        g = "Live grep",
        b = "Buffers",
        h = "Help tags",
        r = "Recent files",
        c = "Commands",
        k = "Keymaps",
      },
      ["<leader>g"] = {
        name = "Git",
        b = "Blame line",
        p = "Preview hunk",
        r = "Reset hunk",
        s = "Stage hunk",
        u = "Undo stage hunk",
        n = "Next hunk",
        N = "Previous hunk",
        S = "Git status (telescope)",
        C = "Git commits (telescope)",
        B = "Git branches (telescope)",
      },
      ["<leader>h"] = {
        name = "Harpoon",
        a = "Add file",
        m = "Toggle menu",
        ["1"] = "File 1",
        ["2"] = "File 2",
        ["3"] = "File 3",
        ["4"] = "File 4",
      },
      ["<leader>l"] = {
        name = "LSP",
        r = "References",
        d = "Definitions",
        s = "Document symbols",
        w = "Workspace symbols",
      },
      ["<leader>x"] = {
        name = "Diagnostics",
        x = "Toggle diagnostics",
        w = "Workspace diagnostics",
        l = "Location list",
        q = "Quickfix list",
      },
      ["<leader>s"] = {
        name = "Search/Replace",
        w = "Search current word",
        p = "Search in file",
      },
      ["<leader>q"] = {
        name = "Session",
        s = "Load session",
        l = "Load last session",
        d = "Stop session saving",
      },
      ["<leader>S"] = "Open Spectre (Search & Replace)",
      ["<leader>/"] = "Search in buffer",
      ["<C-n>"] = "Toggle file tree",
      ["<C-h>"] = "Move to left window",
      ["<C-j>"] = "Move to bottom window",
      ["<C-k>"] = "Move to top window",
      ["<C-l>"] = "Move to right window",
      ["<S-h>"] = "Previous buffer",
      ["<S-l>"] = "Next buffer",
      ["<A-j>"] = "Move line down",
      ["<A-k>"] = "Move line up",
      ["<C-Up>"] = "Resize window up",
      ["<C-Down>"] = "Resize window down",
      ["<C-Left>"] = "Resize window left",
      ["<C-Right>"] = "Resize window right",
    })

    -- Register visual mode keybindings
    wk.register({
      ["<leader>f"] = "Format selection",
      ["<"] = "Indent left (stay selected)",
      [">"] = "Indent right (stay selected)",
      p = "Paste without yanking",
      ["<A-j>"] = "Move selection down",
      ["<A-k>"] = "Move selection up",
    }, { mode = "v" })

    -- Register insert mode keybindings
    wk.register({
      jk = "Exit insert mode",
      kj = "Exit insert mode",
    }, { mode = "i" })
  end
}
