-- AI integration. claudecode.nvim is a Neovim-side bridge for the
-- Claude Code CLI: it spawns a WebSocket server and writes a lock
-- file at ~/.claude/ide/<port>.lock. Whenever `claude` runs in *any*
-- terminal (tmux pane, :ClaudeCode split, anywhere on the same
-- machine), it auto-discovers and connects. Once connected, Claude
-- can see your current buffer, your visual selection, and proposed
-- diffs render in nvim for accept/deny.
--
-- Pulls in folke/snacks.nvim as a dependency (terminal module only).
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>a",  nil,                              desc = "AI / Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude (in nvim split)" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude window" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude session" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude session" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer to context" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        desc = "Send selection to Claude", mode = "v" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept proposed diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny proposed diff" },
  },
}
