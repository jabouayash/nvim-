-- Plugin specs are split across sibling files (colorscheme.lua, lsp.lua,
-- ui.lua, etc.). Lazy.nvim discovers and merges all of them automatically;
-- this file just needs to exist so `require("lazy").setup("plugins")`
-- resolves the directory module.
return {}
