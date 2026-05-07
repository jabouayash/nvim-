local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- LSP keymaps are registered globally (not in on_attach) so the bindings
-- exist in every buffer regardless of LSP attachment. Without this, keys
-- like <leader>rn fall through to vim defaults in non-LSP buffers
-- (<Space> -> "right", r -> "replace char", n -> the replacement),
-- silently mangling text. Each handler checks for an attached client
-- and notifies instead of erroring.
-- `method` is an LSP method string like "textDocument/implementation".
-- Uses client:supports_method, which is what nvim's own vim.lsp.buf.*
-- helpers use internally -- accounts for both static capabilities and
-- dynamic registration. Passing nil skips the method check (only checks
-- that *some* LSP is attached).
local function lsp_action(fn, method)
  return function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
      vim.notify("No LSP attached to this buffer", vim.log.levels.WARN)
      return
    end
    if method then
      local supported = false
      for _, c in ipairs(clients) do
        if c:supports_method(method, 0) then
          supported = true
          break
        end
      end
      if not supported then
        local names = vim.tbl_map(function(c) return c.name end, clients)
        vim.notify(
          string.format("LSP %s does not support %s", table.concat(names, "/"), method),
          vim.log.levels.WARN
        )
        return
      end
    end
    fn()
  end
end

local function lsp_cmd(cmd, method)
  return lsp_action(function() vim.cmd(cmd) end, method)
end

local on_attach = function(_, _) end -- no-op; kept so the call site below is unchanged

-- Used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configure diagnostics (signs use the modern severity-keyed API)
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Add border to hover windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- Language server configurations
local servers = {
  -- Lua
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        telemetry = { enable = false },
      },
    },
  },

  -- Python
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },

  -- TypeScript/JavaScript
  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- HTML
  html = {
    settings = {
      html = {
        format = {
          templating = true,
          wrapLineLength = 120,
          wrapAttributes = "auto",
        },
        hover = {
          documentation = true,
          references = true,
        },
      },
    },
  },

  -- CSS
  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "warning",
        },
      },
    },
  },

  -- Tailwind CSS
  tailwindcss = {
    filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          },
        },
      },
    },
  },

  -- Emmet
  emmet_ls = {
    filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },

  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },

  -- Rust
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },

  -- Bash
  bashls = {},

  -- JSON
  jsonls = {
    settings = {
      json = {
        validate = { enable = true },
      },
    },
  },

  -- YAML
  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          enable = true,
        },
      },
    },
  },

  -- Java
  jdtls = {
    cmd = { "jdtls" },
    settings = {
      java = {
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
        },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
      },
    },
  },

}

-- Apply shared on_attach + capabilities to every server, then layer
-- per-server settings on top. This uses the nvim-0.11+ vim.lsp API;
-- the legacy `lspconfig[name].setup()` framework is deprecated and
-- removed in nvim-lspconfig v3.0.0.
vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = capabilities,
})
for name, config in pairs(servers) do
  vim.lsp.config(name, config)
end
vim.lsp.enable(vim.tbl_keys(servers))

-- Global LSP keymaps. Bound at module scope (not in on_attach) so they
-- exist regardless of LSP attachment -- see comment at top of file.
local map = vim.keymap.set

-- Universal "go to" (kept at top-level: cross-editor convention)
map("n", "gd", lsp_cmd("Lspsaga goto_definition", "textDocument/definition"),    { desc = "LSP: go to definition" })
map("n", "gD", lsp_action(vim.lsp.buf.declaration, "textDocument/declaration"),  { desc = "LSP: go to declaration" })
map("n", "K",  lsp_cmd("Lspsaga hover_doc", "textDocument/hover"),               { desc = "LSP: hover docs" })

-- LSP namespace (frees vim's gi / gt / gR for their defaults)
map("n", "<leader>li", lsp_cmd("Telescope lsp_implementations", "textDocument/implementation"), { desc = "Implementations" })
map("n", "<leader>ly", lsp_cmd("Lspsaga goto_type_definition",  "textDocument/typeDefinition"), { desc = "Type definition" })
map("n", "<leader>lr", lsp_cmd("Telescope lsp_references",      "textDocument/references"),     { desc = "References" })
map("n", "<leader>ld", lsp_cmd("Telescope diagnostics bufnr=0"),                           { desc = "Document diagnostics" })
map("n", "<leader>lo", lsp_cmd("Lspsaga outline"),               { desc = "Outline" })
map("n", "<leader>ls", "<cmd>LspRestart<CR>",                    { desc = "Restart LSP" })
map("n", "<leader>lh", "<cmd>checkhealth vim.lsp<CR>",           { desc = "LSP healthcheck" })

-- Conventional bindings (kept at familiar locations, now bug-free)
map({ "n", "v" }, "<leader>ca", lsp_cmd("Lspsaga code_action", "textDocument/codeAction"), { desc = "Code action" })
map("n", "<leader>rn", lsp_cmd("Lspsaga rename", "textDocument/rename"),                   { desc = "Rename symbol" })
-- Line diagnostics: lives under <leader>l, not <leader>d, because
-- <leader>d is the delete-no-yank operator and the prefix overlap
-- causes a 300ms operator-pending stall on slow keypresses. No method
-- check needed -- diagnostics come from vim.diagnostic, not direct LSP.
map("n", "<leader>le", "<cmd>Lspsaga show_line_diagnostics<CR>",        { desc = "Line diagnostics (current line)" })

-- Diagnostic nav: vim.diagnostic works without LSP (diagnostics can
-- come from other sources), so no availability check needed.
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,  { desc = "Next diagnostic" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })

-- Signature help (insert mode only is conventional, but normal-mode is fine)
map("n", "<C-k>", lsp_action(vim.lsp.buf.signature_help, "textDocument/signatureHelp"), { desc = "Signature help" })