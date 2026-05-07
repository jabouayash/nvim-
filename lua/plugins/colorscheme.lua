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
        diffview = true,
        native_lsp = { enabled = true },
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
      },
    })
    vim.cmd.colorscheme "catppuccin"

    -- Diff highlights: saturated bg only, so treesitter syntax colors on the
    -- diff lines survive. DiffText stays bold for intra-line changes.
    -- `nocombine = true` prevents CursorLine from diluting the diff bgs when
    -- the cursor crosses a diff line. Survives :colorscheme reloads.
    local function apply_diff_hl()
      local ok, palettes = pcall(require, "catppuccin.palettes")
      if not ok then return end
      local cp = palettes.get_palette("mocha")

      -- Line-level groups: bg only (no fg) so syntax highlighting shows through.
      vim.api.nvim_set_hl(0, "DiffAdd",    { bg = "#1e4d2b", nocombine = true })
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#4d1f26", nocombine = true })
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f3352", nocombine = true })
      vim.api.nvim_set_hl(0, "DiffText",   { bg = "#5c3a1e", bold = true, nocombine = true })

      -- diffview-specific context / dim groups
      vim.api.nvim_set_hl(0, "DiffviewDiffAddAsDelete", { bg = "#4d1f26", nocombine = true })
      vim.api.nvim_set_hl(0, "DiffviewDiffDelete",      { fg = cp.surface2, bg = "NONE" })

      -- gitsigns gutter signs + hunk-preview groups (sign column only, not text)
      vim.api.nvim_set_hl(0, "GitSignsAdd",           { fg = cp.green })
      vim.api.nvim_set_hl(0, "GitSignsChange",        { fg = cp.yellow })
      vim.api.nvim_set_hl(0, "GitSignsDelete",        { fg = cp.red })
      vim.api.nvim_set_hl(0, "GitSignsAddPreview",    { link = "DiffAdd" })
      vim.api.nvim_set_hl(0, "GitSignsDeletePreview", { link = "DiffDelete" })
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin*",
      callback = apply_diff_hl,
    })
    apply_diff_hl()
  end,
}
