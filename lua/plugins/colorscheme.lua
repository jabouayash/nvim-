-- Colorscheme: switch by uncommenting one option below.

-- Alternative: Dracula (brighter, matches tmux)
-- {
--   "dracula/vim",
--   name = "dracula",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme "dracula"
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--   end,
-- },

return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
