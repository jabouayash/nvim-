return {
  "OXY2DEV/markview.nvim",
  lazy = false, -- Should not be lazy loaded
  priority = 49, -- Load after colorscheme
  ft = { "markdown", "md" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("markview").setup({
      experimental = {
        check_rtp_message = false,
      },
      preview = {
        modes = { "n", "no", "c" },
        hybrid_modes = { "n" },
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2
            vim.wo[win].concealcursor = "nc"
          end,
        },
      },
    })

    vim.keymap.set("n", "<leader>m", "<cmd>Markview<CR>", { desc = "Toggle Markview" })
  end,
}
