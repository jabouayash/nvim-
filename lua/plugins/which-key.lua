return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- modern, classic, or helix
    delay = 200, -- must be below timeoutlen (300) for the popup to show before keymaps time out
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    win = {
      border = "rounded",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    show_help = true,
    show_keys = true,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.add({
      { "<leader>a", group = "ai/claude" },
      { "<leader>b", group = "buffer" },
      { "<leader>f", group = "find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "hunk/git" },
      { "<leader>l", group = "lsp" },
      { "<leader>q", group = "session" },
      { "<leader>r", group = "rename" },
      { "<leader>s", group = "split/search" },
      { "<leader>t", group = "tab/toggle/term" },
      { "<leader>x", group = "diagnostics/trouble" },
    })
  end,
}
