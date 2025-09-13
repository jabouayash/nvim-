-- Keymaps
local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window navigation (easier than C-w + hjkl)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Telescope (fuzzy finder)
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "Find git files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Find commands" })
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Find keymaps" })

-- Move lines up and down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better line joining (keeps cursor position)
keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- Keep search terms centered
keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- Greatest remap ever - paste without yanking
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Delete without yanking
keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Yank to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- Search and replace word under cursor
keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Make file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Quickfix navigation
keymap.set("n", "]Q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
keymap.set("n", "[Q", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })

-- Buffer navigation (handled by bufferline, but keep as backup)
keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "[b", ":bprev<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Better navigation with brackets
keymap.set("n", "]t", ":tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "[t", ":tabprev<CR>", { desc = "Previous tab" })

-- Diagnostics (handled by LSP, but keep global ones)
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle trouble list" })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace diagnostics" })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document diagnostics" })
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Location list" })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix list" })

-- Formatting
keymap.set("n", "<leader>fm", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { desc = "Format file" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Disable Q (ex mode)
keymap.set("n", "Q", "<nop>")

-- Session management
keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })
keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Restore last session" })
keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop session recording" })

-- Todo comments navigation (using T instead of t to avoid conflict with tabs)
keymap.set("n", "]T", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
keymap.set("n", "[T", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Todo comments in trouble" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todo comments" })

-- Source current file (only for vim/lua files)
keymap.set("n", "<leader><leader>", function()
  local ft = vim.bo.filetype
  if ft == "vim" or ft == "lua" then
    vim.cmd("so")
  else
    vim.notify("Can only source vim/lua files", vim.log.levels.WARN)
  end
end, { desc = "Source current file (vim/lua only)" })