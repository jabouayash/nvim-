return {
  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "]h", function()
            if vim.wo.diff then return "]h" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Next hunk" })

          map("n", "[h", function()
            if vim.wo.diff then return "[h" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, desc = "Previous hunk" })

          map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
          map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
          map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage hunk" })
          map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset hunk" })
          map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
          map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
          map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })
          map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
          map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
          map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
          map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "Diff this ~" })
          map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle deleted" })
        end,
      })
    end,
  },

  -- Diff review (whole-changeset view, file history)
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      { "<leader>gs", "<cmd>DiffviewOpen<CR>", desc = "Review pending changes" },
      { "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "Close diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (current)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "File history (repo)" },
      {
        "<leader>gm",
        function()
          -- Detect the remote's default branch instead of hardcoding it.
          -- Some repos use `mainline`, some `main`, some `master`. Try
          -- the symbolic ref first (set by clone or `git remote set-head`),
          -- then fall back to checking which candidate actually exists.
          local function find_default()
            local ref = vim.fn.systemlist("git symbolic-ref refs/remotes/origin/HEAD --short 2>/dev/null")[1]
            if ref and ref ~= "" then return ref end
            for _, candidate in ipairs({ "origin/main", "origin/mainline", "origin/master" }) do
              vim.fn.system("git rev-parse --verify " .. candidate .. " 2>/dev/null")
              if vim.v.shell_error == 0 then
                return candidate
              end
            end
            return nil
          end

          local default = find_default()
          if not default then
            vim.notify("Could not find origin's default branch (tried symbolic-ref, main, mainline, master)", vim.log.levels.WARN)
            return
          end
          -- Three-dot syntax = diff from merge-base, i.e. "what's in my
          -- PR" (ignores commits added to main since I branched).
          vim.cmd("DiffviewOpen " .. default .. "...HEAD")
        end,
        desc = "Review branch vs origin default (PR view)",
      },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = { layout = "diff3_mixed" },
      },
    },
  },
}
