-- Clipboard integration
vim.opt.clipboard = "unnamed"

-- Case sensitivity in searches
vim.opt.ignorecase = true
vim.opt.smartcase = false

-- Highlight search results
vim.opt.hlsearch = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor shape in insert and normal modes (for terminal support)
vim.cmd([[let &t_SI = "\e[6 q"]])
vim.cmd([[let &t_EI = "\e[2 q"]])
