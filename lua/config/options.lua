-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Better LSP diagnostics display
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Set up some helpful options for .NET development
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append("c") -- Don't show completion menu messages
