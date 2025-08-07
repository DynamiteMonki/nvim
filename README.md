# Neovim Configuration

## Installed Plugins

### Core Functionality
- **lazy.nvim** - Plugin manager
- **nvim-tree.lua** - File explorer
- **telescope.nvim** - Fuzzy finder and picker
- **nvim-treesitter** - Syntax highlighting
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP/DAP/linter/formatter installer
- **nvim-cmp** - Completion engine

### UI & Appearance
- **lualine.nvim** - Status line
- **bufferline.nvim** - Buffer tabs
- **alpha-nvim** - Start screen
- **indent-blankline.nvim** - Indent guides
- **nvim-colorizer.lua** - Color code highlighting
- **tokyonight.nvim** / **midnight.lua** - Color schemes

### Git Integration
- **gitsigns.nvim** - Git signs and hunks
- **vim-fugitive** - Git commands

### Code Enhancement
- **nvim-surround** - Surround text objects
- **leap.nvim** - Enhanced navigation
- **Comment.nvim** - Smart commenting
- **nvim-autopairs** - Auto bracket pairing
- **conform.nvim** - Code formatting

### Productivity
- **harpoon** - Quick file navigation
- **trouble.nvim** - Diagnostics and quickfix
- **nvim-spectre** - Search and replace
- **persistence.nvim** - Session management
- **which-key.nvim** - Key binding help
- **toggleterm.nvim** - Terminal integration

## Key Bindings

**Leader key:** `<Space>`

### File Navigation (Telescope)
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - List buffers
- `<leader>fh` - Help tags
- `<leader>fr` - Recent files
- `<leader>fc` - Commands
- `<leader>fk` - Keymaps
- `<leader>/` - Search in current buffer

### Git Operations
**Gitsigns:**
- `<leader>gb` - Blame line
- `<leader>gp` - Preview hunk
- `<leader>gr` - Reset hunk
- `<leader>gs` - Stage hunk
- `<leader>gu` - Undo stage hunk
- `<leader>gn` - Next hunk
- `<leader>gN` - Previous hunk

**Telescope Git:**
- `<leader>gS` - Git status (Telescope)
- `<leader>gC` - Git commits (Telescope)
- `<leader>gB` - Git branches (Telescope)

### Navigation & Movement
**Window Navigation:**
- `<C-h>` - Move to left window
- `<C-j>` - Move to bottom window
- `<C-k>` - Move to top window
- `<C-l>` - Move to right window

**Buffer Navigation:**
- `<S-l>` - Next buffer
- `<S-h>` - Previous buffer

**Text Movement:**
- `<A-j>` - Move line/selection down
- `<A-k>` - Move line/selection up

**Leap Navigation:**
- `s` - Leap forward
- `S` - Leap backward

### Harpoon (Quick Navigation)
- `<leader>ha` - Add file to harpoon
- `<leader>hm` - Toggle harpoon menu
- `<leader>h1` - Jump to harpoon file 1
- `<leader>h2` - Jump to harpoon file 2
- `<leader>h3` - Jump to harpoon file 3
- `<leader>h4` - Jump to harpoon file 4

### Code Operations
- `<leader>f` - Format code
- `gcc` - Comment/uncomment line
- `gc` - Comment/uncomment selection (visual mode)

### LSP (Telescope)
- `<leader>lr` - LSP references
- `<leader>ld` - LSP definitions
- `<leader>ls` - LSP document symbols
- `<leader>lw` - LSP workspace symbols

### Diagnostics (Trouble)
- `<leader>xx` - Toggle diagnostics
- `<leader>xw` - Workspace diagnostics
- `<leader>xl` - Location list
- `<leader>xq` - Quickfix list

### Search & Replace (Spectre)
- `<leader>S` - Open Spectre
- `<leader>sw` - Search current word
- `<leader>sp` - Search in current file

### Session Management
- `<leader>qs` - Load session
- `<leader>ql` - Load last session
- `<leader>qd` - Stop session saving

### File Explorer
- `<C-n>` - Toggle nvim-tree

### Terminal
- `<C-\>` - Toggle terminal (from toggleterm)

### Insert Mode
- `jk` or `kj` - Exit insert mode

### Visual Mode
- `<` - Indent left (and stay selected)
- `>` - Indent right (and stay selected)
- `p` - Paste without yanking

## Plugin Features

### Auto-completion (nvim-cmp)
- Intelligent code completion
- Snippet support
- LSP integration

### Treesitter
- Enhanced syntax highlighting
- Code folding
- Text objects

### Formatting (conform.nvim)
- Format on save enabled
- Language-specific formatters:
  - Lua: stylua
  - Python: black, isort
  - JavaScript/TypeScript: prettier
  - CSS/HTML/JSON: prettier
  - Bash: shfmt
  - C/C++: clang-format

### Git Integration
- Visual git signs in gutter
- Blame information
- Hunk navigation and staging
- Git status and log via Telescope

### Session Persistence
- Automatic session saving
- Restore previous session on startup
- Manual session management

## Installation Notes

1. All plugins will be automatically installed by Lazy.nvim on first startup
2. LSP servers need to be installed via Mason (`:Mason`)
3. Formatters may need to be installed separately for some languages
4. Restart Neovim after installation to load all configurations

## Customization

- Modify plugin configurations in `lua/plugins/`
- Adjust keymaps in `lua/core/keymaps.lua`
- Update options in `lua/core/options.lua`
- Plugin-specific configs in `lua/config/`
