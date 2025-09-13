# 🚀 Neovim Quick Start Guide

Welcome to your VS Code-killer Neovim setup! Here's everything you need to get productive in 5 minutes.

## 📦 First Time Setup

### 1. Install Dependencies (if you haven't already)
```bash
~/.config/nvim/install-deps.sh
```

### 2. Install a Nerd Font
```bash
brew install --cask font-jetbrains-mono-nerd-font
```
Then set your **terminal font** to "JetBrainsMono Nerd Font"

### 3. Open Neovim
```bash
nvim
```
Wait for plugins to auto-install (happens once)

## 🎯 The 10 Commands You'll Use Most

| Command | What it does | When to use it |
|---------|-------------|----------------|
| `<C-p>` | Find files (fuzzy) | Opening files quickly |
| `<C-n>` | File explorer | Browse project structure |
| `<leader>fg` | Search in files | Find text across project |
| `K` | Show docs/hover | What does this function do? |
| `gd` | Go to definition | Jump to where it's defined |
| `<leader>ca` | Code actions | Fix errors, add imports |
| `gcc` | Toggle comment | Comment out code |
| `<C-\>` | Terminal | Run commands |
| `<S-h>`/`<S-l>` | Switch tabs | Navigate open files |
| `<Space>` wait | Command palette | See all available commands |

> **Leader key = Space bar**

## 🏃 Your First Workflow

### Opening a Project
```bash
cd my-project
nvim .
```

### Basic Workflow
1. **Find a file**: Press `<C-p>`, type part of filename, `<Enter>`
2. **Explore files**: Press `<C-n>` to open sidebar
3. **Search project**: `<leader>fg` then type search term
4. **Edit code**: `i` to insert, `<Esc>` to exit insert mode
5. **Save**: `:w` (or `:wq` to save and quit)

### Working with Code
1. **See function info**: Hover cursor on function, press `K`
2. **Go to definition**: Cursor on function, press `gd`
3. **Find all usages**: Cursor on function, press `gr`
4. **Rename**: Cursor on variable, `<leader>rn`, type new name
5. **Fix error**: When you see red underline, `<leader>ca` for fixes

### Quick Edits
- **Comment line**: `gcc`
- **Delete line**: `dd`
- **Copy line**: `yy`
- **Paste**: `p`
- **Undo**: `u`
- **Redo**: `<C-r>`

## 🎨 Understanding the UI

```
┌─────────────────────────────────────────────┐
│ 📁 File Explorer │ 📑 Tabs (Bufferline)      │
│                  ├──────────────────────────┤
│  > src/          │                          │
│    - index.js    │  Your code here         │
│    - app.js      │                          │
│  > tests/        │  K = hover docs          │
│                  │  gd = go to definition   │
│                  │                          │
├──────────────────┴──────────────────────────┤
│ 🔍 Status Bar (Lualine) - Mode, Git, File   │
└─────────────────────────────────────────────┘
```

## 🔥 Power User Tips

### Navigation
- **Half page scroll**: `<C-d>` (down) / `<C-u>` (up)
- **Jump to line**: `42G` (goes to line 42)
- **Search in file**: `/searchterm` then `n` for next

### Editing
- **Change word**: `ciw` (delete word and enter insert)
- **Change inside quotes**: `ci"`
- **Visual select**: `v` then move to select
- **Select line**: `V`
- **Indent**: `>>` (or `>` in visual mode)

### Multiple Files
- **Split window**: `<leader>sv` (vertical) or `<leader>sh` (horizontal)
- **Navigate splits**: `<C-h/j/k/l>`
- **Switch buffers**: `<S-h>` / `<S-l>` (like browser tabs)

### Terminal
- **Open terminal**: `<C-\>`
- **Exit terminal mode**: `<Esc>` or `jk`
- **Run command**: `:!ls` (runs ls command)

## 🆘 When You're Stuck

### Can't remember a command?
Press `<Space>` and wait - Which-key shows all commands!

### How to exit?
- `:q` - Quit (`:q!` to force quit without saving)
- `:wq` - Save and quit
- `:x` - Save and quit (shorter)

### Something broken?
- `:checkhealth` - See what's wrong
- `:Lazy` - Check plugin status
- `:Mason` - Check language servers
- `:LspInfo` - See active language servers

### Need help?
- `<leader>fh` - Search help docs
- `:help keyword` - Get help on any topic
- `K` on any vim function - See its documentation

## 📚 Learning Path

### Week 1: Basics
- Master `<C-p>` for file finding
- Use `<C-n>` for file exploration
- Learn `i`, `<Esc>`, `:w`, `:q`
- Use `K` for documentation

### Week 2: Efficiency
- Learn `gd`, `gr` for code navigation
- Use `<leader>ca` for code actions
- Master `<leader>fg` for searching
- Try `gcc` for commenting

### Week 3: Power User
- Learn visual mode (`v`, `V`)
- Master `ciw`, `ci"`, `da"`
- Use splits and multiple buffers
- Integrate terminal workflow

## 🎮 VS Code Equivalents

| VS Code | Neovim | Command |
|---------|--------|---------|
| Ctrl+P | `<C-p>` | Quick file open |
| Ctrl+Shift+P | `<Space>` wait | Command palette |
| Ctrl+Shift+F | `<leader>fg` | Search in files |
| F12 | `gd` | Go to definition |
| Shift+F12 | `gr` | Find references |
| F2 | `<leader>rn` | Rename symbol |
| Ctrl+. | `<leader>ca` | Quick fix |
| Ctrl+/ | `gcc` | Toggle comment |
| Ctrl+` | `<C-\>` | Terminal |
| Ctrl+B | `<C-n>` | Toggle sidebar |
| Ctrl+Shift+E | `<C-n>` | File explorer |
| Ctrl+Tab | `<S-l>` | Next tab |
| Alt+Click | `<C-]>` | Go to definition |

## 🎯 Your Daily Driver Checklist

- [ ] Can open files with `<C-p>`
- [ ] Can search project with `<leader>fg`
- [ ] Can navigate code with `gd` and `gr`
- [ ] Can see docs with `K`
- [ ] Can comment with `gcc`
- [ ] Can use terminal with `<C-\>`
- [ ] Can save (`:w`) and quit (`:q`)
- [ ] Know how to get help (`<Space>` wait)

Once you check all these, you're ready to use Neovim as your main editor!

---

💡 **Remember**: Everything is a text object. Think in terms of actions (delete, change, yank) + objects (word, line, paragraph). This is the Vim way!