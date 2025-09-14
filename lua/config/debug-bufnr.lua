-- Debug configuration to find bufnr issues
-- This wraps vim.lsp functions to check for invalid bufnr values

local original_notify = vim.lsp.handlers["textDocument/publishDiagnostics"]

if original_notify then
  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
    if ctx and ctx.bufnr then
      if type(ctx.bufnr) == "function" then
        vim.notify("ERROR: bufnr is a function in publishDiagnostics!", vim.log.levels.ERROR)
        -- Try to fix it by calling the function
        ctx.bufnr = ctx.bufnr()
      elseif type(ctx.bufnr) ~= "number" then
        vim.notify("ERROR: bufnr is not a number: " .. type(ctx.bufnr), vim.log.levels.ERROR)
        ctx.bufnr = vim.api.nvim_get_current_buf()
      end
    end
    return original_notify(err, result, ctx, config)
  end
end

-- Also wrap the common LSP attach to debug
local original_start_client = vim.lsp.start_client

vim.lsp.start_client = function(config)
  if config and config.on_attach then
    local original_on_attach = config.on_attach
    config.on_attach = function(client, bufnr)
      if type(bufnr) == "function" then
        vim.notify("ERROR: bufnr is a function in on_attach!", vim.log.levels.ERROR)
        bufnr = vim.api.nvim_get_current_buf()
      elseif type(bufnr) ~= "number" then
        vim.notify("ERROR: bufnr is not a number in on_attach: " .. type(bufnr), vim.log.levels.ERROR)
        bufnr = vim.api.nvim_get_current_buf()
      end
      return original_on_attach(client, bufnr)
    end
  end
  return original_start_client(config)
end

vim.notify("Debug bufnr module loaded - will report any bufnr type issues", vim.log.levels.INFO)