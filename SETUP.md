# Neovim Configuration Setup

## Requirements

### 1. Install a Nerd Font (REQUIRED for icons)

The question mark symbols you're seeing are because you need a Nerd Font installed and configured in your terminal.

#### Quick Install (macOS):
```bash
# Using Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
# OR
brew install --cask font-hack-nerd-font
# OR
brew install --cask font-meslo-lg-nerd-font
```

#### Manual Install:
1. Go to https://www.nerdfonts.com/font-downloads
2. Download a font (recommend JetBrainsMono, Hack, or MesloLG)
3. Install the font on your system
4. **Configure your terminal to use the Nerd Font**:
   - **iTerm2**: Preferences → Profiles → Text → Font
   - **Terminal.app**: Preferences → Profiles → Text → Font
   - **Alacritty**: Edit config file, set font family
   - **Kitty**: Edit config file, set font_family

### 2. Install Dependencies

```bash
# Node.js (for many LSP servers)
brew install node

# Ripgrep (for telescope grep)
brew install ripgrep

# fd (for better file finding)
brew install fd

# Make (for telescope-fzf-native)
brew install make

# Python provider (optional)
pip3 install pynvim

# Ruby provider (optional)
gem install neovim

# Language-specific (install only what you need):
# Go (for gopls)
brew install go

# .NET (for C# development)
brew install --cask dotnet-sdk
```

## First Time Setup

1. **Start Neovim**:
   ```bash
   nvim
   ```

2. **Wait for Lazy.nvim to install** (should happen automatically)

3. **Install plugins**:
   - Restart Neovim or run `:Lazy` to see plugin manager
   - Plugins should auto-install

4. **Install LSP servers**:
   - Run `:Mason` to open Mason
   - LSP servers should auto-install based on config
   - Manual install: Press `i` on any server in Mason UI

5. **Install Treesitter parsers**:
   ```vim
   :TSInstall all
   ```

## Key Features

### File Navigation
- `<C-n>` - Toggle file tree (like VS Code sidebar)
- `<C-p>` - Fuzzy find git files
- `<leader>ff` - Find files
- `<leader>fg` - Live grep in files
- `<leader>fb` - Browse open buffers

### Tabs (Bufferline)
- `<S-h>` / `<S-l>` - Navigate tabs left/right
- `<leader>bd` - Close current buffer

### Terminal
- `<C-\>` - Toggle floating terminal

### Git Integration
- Git signs in gutter show changes
- `<leader>gs` - Git status (if fugitive installed)
- `]h` / `[h` - Navigate git hunks

### LSP Features
- `K` - Hover documentation
- `gd` - Go to definition
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `]d` / `[d` - Navigate diagnostics

### Which-key Help
- Press `<leader>` and wait - shows all available commands
- `<leader>fk` - Search all keymaps

## Troubleshooting

### Still seeing ? symbols
1. Make sure you installed a Nerd Font
2. **Make sure your terminal is configured to use the Nerd Font**
3. Try a different Nerd Font
4. Verify with: `echo "\ue0a0"` - should show a git branch symbol

### LSP not working
1. Check `:LspInfo` for status
2. Check `:Mason` for installed servers
3. Install missing servers in Mason with `i`

### Slow startup
1. Run `:Lazy profile` to see slow plugins
2. Consider disabling unused plugins

### Colors look wrong
1. Make sure your terminal supports true colors
2. Try different terminal emulator
3. Check `echo $TERM` - should include "256color"

## Customization

### Change theme
Edit `lua/plugins/init.lua` and change the colorscheme from "catppuccin" to:
- `tokyonight`
- `gruvbox`
- `onedark`
- `dracula`

### Add more LSP servers
Edit `lua/plugins/init.lua` in the Mason section, add to `ensure_installed`

### Modify keybindings
Edit `lua/config/keymaps.lua`

## VS Code Feature Parity

✅ File Explorer Sidebar (nvim-tree)
✅ Tabs for open files (bufferline)
✅ Integrated Terminal (toggleterm)
✅ Git integration (gitsigns + fugitive)
✅ Fuzzy file search (telescope)
✅ Command palette (which-key + telescope commands)
✅ Auto-completion with icons (nvim-cmp + lspkind)
✅ Syntax highlighting (treesitter)
✅ Error/warning diagnostics (LSP + trouble)
✅ Status bar (lualine)
✅ Indent guides (indent-blankline)
✅ Bracket matching (autopairs + treesitter)
✅ Multiple cursors (via visual block mode)
✅ Format on save (conform.nvim)
✅ Quick fixes (LSP code actions)