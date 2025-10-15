-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.settings")

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

vim.cmd([[
  autocmd VimEnter * silent! lcd %:p:h
]])

require("custom.commands")
