return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      require("neodev").setup({})
      require("config.lsp")
    end,
  },

  -- LSP UI enhancements
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({
        ui = {
          theme = "round",
          border = "rounded",
          winblend = 0,
          code_action = "💡",
        },
        diagnostic = {
          show_code_action = true,
          show_source = true,
          jump_num_shortcut = true,
        },
        lightbulb = {
          enable = true,
          sign = true,
          sign_priority = 40,
          virtual_text = false,
        },
        symbol_in_winbar = {
          enable = false,
        },
      })
    end,
  },

  -- LSP progress
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "pipe",
          done = "✔",
        },
      })
    end,
  },

  -- Mason - LSP installer
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls", -- TypeScript/JavaScript
          "rust_analyzer",
          -- "gopls", -- Requires Go to be installed
          -- "omnisharp", -- C# / .NET (re-enable + add csharp_ls config in lsp.lua to use)
          "bashls",
          "jsonls",
          "yamlls",
          "html",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          "jdtls", -- Java
        },
        automatic_installation = true,
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "black",
          "pylint",
          "eslint_d",
          "shellcheck",
        },
      })
    end,
  },
}
