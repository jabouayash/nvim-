# Neovim Keybindings Quick Reference

> **Leader key = `Space`** (press Space, then the next key)
> Press `<Space>` and wait to see available commands with Which-key!

## 🚀 Essential Navigation

### File Navigation
- `<C-n>` - **Toggle file explorer** (sidebar like VS Code)
- `<C-p>` - **Find files in git** (super fast fuzzy search)
- `<leader>ff` - Find any files
- `<leader>fg` - **Search text in all files** (like VS Code search)
- `<leader>fb` - Browse open buffers/tabs
- `<leader>fr` - Recent files

### Window/Split Navigation
- `<C-h/j/k/l>` - **Move between windows** (left/down/up/right)
- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally
- `<leader>sx` - Close current split
- `<leader>se` - Make splits equal size

### Buffer/Tab Navigation
- `<S-h>` / `<S-l>` - **Previous/Next buffer tab** (like browser tabs)
- `<leader>bd` - Close current buffer
- `]b` / `[b` - Next/Previous buffer
- `]t` / `[t` - Next/Previous tab

## 💻 Coding Features

### LSP (Language Server)
- `K` - **Show documentation** (hover info)
- `gd` - **Go to definition**
- `gr` - Find references
- `gi` - Go to implementation
- `<leader>ca` - **Code actions** (quick fixes)
- `<leader>rn` - **Rename symbol**
- `<leader>d` - Show line diagnostics
- `]d` / `[d` - Next/Previous error

### Code Editing
- `gcc` - **Comment/uncomment line**
- `gc` (visual) - Comment selection
- `<leader>fm` - **Format file**
- `J` (visual) - Move line down
- `K` (visual) - Move line up
- `>` / `<` (visual) - Indent/Outdent

### Search & Replace
- `/` - Search in file
- `n` / `N` - Next/Previous search result
- `<leader>sr` - **Replace word under cursor**
- `<leader>nh` - Clear search highlights
- `*` - Search word under cursor

## 🎯 Quick Actions

### Copy/Paste/Delete
- `<leader>y` - **Yank to system clipboard**
- `<leader>p` - **Paste without yanking** (keeps clipboard)
- `<leader>d` - Delete without yanking
- `yy` - Yank line
- `dd` - Delete line
- `p` - Paste

### Terminal
- `<C-\>` - **Toggle floating terminal**
- `<Esc>` - Exit terminal mode (in terminal)
- `jk` - Alternative exit from terminal

### Git
- `<leader>gs` - Git status (Fugitive)
- `]h` / `[h` - Next/Previous git change
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk

## 🔍 Telescope (Fuzzy Finder)

- `<C-p>` - **Git files** (fastest)
- `<leader>ff` - All files
- `<leader>fg` - **Live grep** (search text)
- `<leader>fh` - Help/documentation
- `<leader>fk` - Search keymaps
- `<leader>fc` - Commands
- `<leader>ft` - Find TODOs

### Inside Telescope:
- `<C-j/k>` - Navigate results
- `<CR>` - Open file
- `<C-x>` - Open in split
- `<C-v>` - Open in vertical split
- `<C-q>` - Send to quickfix list

## 📁 File Explorer (NvimTree)

- `<C-n>` - Toggle explorer
- **Inside explorer:**
  - `<CR>` or `o` - Open file/folder
  - `a` - Create new file
  - `d` - Delete
  - `r` - Rename
  - `x` - Cut
  - `c` - Copy
  - `p` - Paste
  - `R` - Refresh
  - `H` - Toggle hidden files
  - `?` - Help

## 🎨 Visual Mode

Enter with `v` (character) or `V` (line) or `<C-v>` (block)

- `J` / `K` - Move selection up/down
- `>` / `<` - Indent/outdent
- `gc` - Comment selection
- `<leader>y` - Yank to clipboard
- `<leader>p` - Paste without yanking

## ⚡ Pro Tips

### Movement
- `<C-d>` / `<C-u>` - **Half page down/up** (stays centered)
- `gg` - Go to top of file
- `G` - Go to bottom of file
- `0` - Start of line
- `$` - End of line
- `w` / `b` - Next/Previous word
- `f{char}` - Jump to character

### Surround (cs/ds/ys)
- `cs"'` - Change surrounding " to '
- `ds"` - Delete surrounding "
- `ysiw"` - Surround word with "
- `S"` (visual) - Surround selection with "

### Quick Edits
- `ciw` - **Change inner word**
- `ci"` - Change inside quotes
- `da"` - Delete around quotes
- `.` - **Repeat last action**
- `u` - Undo
- `<C-r>` - Redo

## 🎮 Mode Switching

- `i` - Insert mode (before cursor)
- `a` - Insert mode (after cursor)
- `o` - New line below
- `O` - New line above
- `<Esc>` or `jk` - **Back to Normal mode**
- `v` - Visual mode
- `V` - Visual line mode
- `<C-v>` - Visual block mode

## 📊 Diagnostics & Trouble

- `<leader>xx` - Toggle trouble list
- `<leader>xw` - Workspace diagnostics
- `<leader>xd` - Document diagnostics
- `]d` / `[d` - Navigate diagnostics
- `]T` / `[T` - Navigate TODOs

## 🔧 Session Management

- `<leader>qs` - Restore session
- `<leader>ql` - Restore last session
- `<leader>qd` - Stop session recording

## 💡 Getting Help

- `<Space>` then wait - **See all available commands**
- `<leader>fh` - Search help docs
- `<leader>fk` - Search all keybindings
- `:checkhealth` - Check Neovim health
- `:Mason` - Manage language servers
- `:Lazy` - Manage plugins

---

## 🎯 Most Used Combos

1. **Quick file edit**: `<C-p>` → type filename → `<CR>`
2. **Search & replace**: `<leader>fg` → search → open file → `<leader>sr`
3. **Quick terminal**: `<C-\>` → run command → `<C-\>` to close
4. **Navigate errors**: `]d` to next → `K` for info → `<leader>ca` to fix
5. **Comment code**: Select with `V` → `gc`

---

💡 **Tip**: Can't remember a key? Press `<Space>` and wait - Which-key will show you everything!