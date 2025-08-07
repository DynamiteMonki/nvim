return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    
    -- Setup which-key
    wk.setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on \" in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
      icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
      },
      popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>", -- binding to scroll up inside the popup
      },
      window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
      },
      ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
      hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
      show_help = true, -- show help message on the command line when the popup is visible
      triggers = "auto", -- automatically setup triggers
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })

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
