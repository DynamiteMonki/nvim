# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Common Commands

### Neovim Configuration Management
```bash
# Launch Neovim to test configuration
nvim

# Open Neovim with a specific file to test functionality
nvim init.lua

# Check Neovim health and configuration status
nvim +checkhealth

# Force plugin installation and updates
nvim --headless +Lazy! sync +qa

# Clean old/unused plugins
nvim --headless +Lazy! clean +qa
```

### Plugin Management (Lazy.nvim)
```bash
# Inside Neovim, use these commands:
:Lazy                    # Open plugin manager UI
:Lazy update            # Update all plugins
:Lazy install           # Install missing plugins
:Lazy clean             # Remove unused plugins
:Lazy sync              # Run install, clean and update
:Lazy check             # Check for plugin updates
```

### LSP Management (Mason)
```bash
# Inside Neovim:
:Mason                  # Open Mason UI to manage LSP servers
:MasonInstall <server>  # Install specific LSP server
:MasonUninstall <server> # Uninstall LSP server
:MasonUpdate            # Update all installed tools
:LspInfo                # Show LSP server status
```

### Development and Testing
```bash
# Validate Lua syntax
luacheck lua/

# Test specific plugin configuration
nvim -c "lua require('plugins.lspconfig')"

# Start Neovim with minimal config for debugging
nvim --clean

# Reload configuration during development (inside Neovim)
:source ~/.config/nvim/init.lua

# Format files manually
nvim -c "lua vim.lsp.buf.format({ async = false })" +wq file.lua

# Test none-ls formatting tools
nvim test_formatting.lua  # Open and use <leader>f to format
```

### Formatting and Linting
```bash
# Inside Neovim:
:Mason                  # Install formatters and linters
:MasonInstall stylua   # Install specific formatter
:ConformInfo           # Check conform.nvim status and available formatters
:Lazy load nvim-lint   # Load linting functionality

# Manual formatting and linting commands:
<leader>f              # Format current buffer or selection
<leader>fi             # Show format info (dry run)
<leader>tf             # Toggle auto-formatting on save
<leader>l              # Trigger manual linting
```

## Architecture Overview

### Configuration Structure
This Neovim configuration follows a modular architecture with clear separation of concerns:

- **`init.lua`**: Main entry point that orchestrates configuration loading
- **`lua/core/`**: Core Neovim settings and bootstrapping
- **`lua/plugins/`**: Individual plugin configurations (one file per plugin/feature)
- **`lua/ui.lua`**: UI-specific settings including theme and notifications

### Core Components

#### Bootstrap Process (init.lua → core/)
1. **Options** (`lua/core/options.lua`): Essential Neovim settings (line numbers, indentation, clipboard, etc.)
2. **Keymaps** (`lua/core/keymaps.lua`): Global keybindings with `<Space>` as leader key
3. **Lazy Bootstrap** (`lua/core/lazy.lua`): Plugin manager initialization and auto-installation
4. **UI Setup** (`lua/ui.lua`): Theme configuration and visual tweaks

#### Plugin Architecture
Each plugin is configured in its own file under `lua/plugins/`, returning a lazy.nvim specification table. Key patterns:

- **LSP Stack**: Mason + mason-lspconfig + nvim-lspconfig for language server management
- **Formatting & Linting**: conform.nvim + nvim-lint + mason-tool-installer for modern formatting and linting
- **Completion**: nvim-cmp with multiple sources (LSP, buffer, path, Lua API)
- **File Navigation**: Telescope for fuzzy finding + Neo-tree for file exploration
- **Code Enhancement**: Treesitter for syntax highlighting, autopairs, comments
- **UI Components**: Bufferline, lualine, alpha (dashboard), notifications

#### Language Support
Pre-configured LSP servers managed by Mason:
- **lua_ls** (Lua) - with Neovim API globals, inlay hints, and testing framework support
- **pyright** (Python) - with workspace analysis and type checking
- **clangd** (C/C++) - with background indexing, clang-tidy, and enhanced completion
- **gopls** (Go) - with staticcheck, inlay hints, and unused parameter detection
- **rust_analyzer** (Rust) - with Clippy integration, cargo features, and inlay hints
- **ruby_lsp** (Ruby)
- **ts_ls** (TypeScript/JavaScript) - with comprehensive inlay hints
- **cssls** (CSS)
- **html** (HTML)
- **bashls** (Bash/Shell scripting)
- **jsonls** (JSON) - with validation
- **yamlls** (YAML) - with validation

### Key Design Principles

#### Minimal and Clean
- Focuses on essential functionality without bloat
- Clean, minimal UI with tokyonight-storm theme
- Simple keybindings that don't conflict with Neovim defaults

#### Modular Plugin System
- Each plugin configured in isolation
- Lazy loading where appropriate
- Clear dependency management via lazy.nvim

#### Developer Experience
- Auto-completion with LSP integration
- Modern file navigation with Telescope
- Git integration with Gitsigns
- Terminal integration with ToggleTerm

### Configuration Patterns

#### Plugin Configuration Structure
```lua
return {
    "author/plugin-name",
    dependencies = { "required/plugin" },
    config = function()
        require("plugin").setup({
            -- configuration options
        })
        -- keybindings and additional setup
    end,
}
```

#### Keybinding Patterns
- Leader key: `<Space>`
- File operations: `<leader>f*` (ff=find files, fg=grep, fb=buffers)
- LSP operations: 
  - Navigation: `gd` (definition), `gD` (declaration), `gi` (implementation), `gr` (references), `gt` (type definition)
  - Documentation: `K` (hover), `<C-k>` (signature help)
  - Code actions: `<leader>ca` (code actions), `<leader>rn` (rename), `<leader>f` (format)
  - Diagnostics: `[d`/`]d` (prev/next diagnostic), `<leader>e` (diagnostic float), `<leader>q` (diagnostic list)
  - Workspace: `<leader>wa`/`<leader>wr`/`<leader>wl` (add/remove/list workspace folders)
- Buffer navigation: `<S-h>` (previous), `<S-l>` (next)
- Quick actions: `<leader>w` (save), `<leader>q` (quit), `<leader>h` (clear search)

#### Theme and UI Philosophy
- Dark theme (tokyonight-storm) with transparency
- Minimal notifications (2-second timeout)
- Subtle visual indicators and clean borders
- System clipboard integration

### Development Tools Integration

#### Mise Integration
The `mise.toml` file configures tool versions:
- **Zellij**: Terminal multiplexer (latest version)

This configuration is designed for a clean, efficient Neovim experience focused on core functionality while maintaining extensibility through its modular architecture.