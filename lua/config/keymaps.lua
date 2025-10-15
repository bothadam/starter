-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

-- Paste without overwriting register
keymap("v", "p", '"_dP', { desc = "Paste without overwriting register" })

-- Insert newline and return to normal mode
keymap("n", "<CR>", "o<Esc>", { desc = "Insert newline below" })
keymap("n", "<leader><CR>", "O<Esc>", { desc = "Insert newline above" })

-- Center the cursor after half-page scrolling
keymap("n", "<C-d>", "10jzz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "10kzz", { desc = "Scroll up and center" })

vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle reveal_force_cwd<CR>", { noremap = true, silent = true })

-- LSP keymaps (these will be set when LSP attaches to a buffer)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    
    -- Go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    
    -- Go to implementation
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    
    -- Show hover documentation
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    
    -- Find references
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    
    -- Format document
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
  end,
})
