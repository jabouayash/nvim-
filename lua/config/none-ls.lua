local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    -- Formatting (will work once Mason installs these)
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "typescript",
        "css",
        "scss",
        "html",
        "json",
        "yaml",
        "markdown",
      },
    }),
    formatting.black.with({ extra_args = { "--fast" } }), -- Python
    formatting.rustfmt,                                    -- Rust (you have this installed)
    formatting.gofmt,                                      -- Go
    formatting.clang_format,                               -- C/C++
    
    -- Diagnostics/Linting
    diagnostics.shellcheck,                                -- Bash
  },
  
  -- Format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})