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
