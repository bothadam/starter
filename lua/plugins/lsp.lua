-- return {
--   -- Install Mason
--   {
--     "williamboman/mason.nvim",
--     build = ":MasonUpdate",
--     config = function()
--       require("mason").setup()
--     end,
--   },
--
--   -- Make Mason work with LSP
--   {
--     "williamboman/mason-lspconfig.nvim",
--     opts = {
--       ensure_installed = { "tsserver" },
--     },
--   },
--
--   -- Configure LSPs
--   {
--     "neovim/nvim-lspconfig",
--     opts = {
--       servers = {
--         tsserver = {},
--       },
--     },
--   },
-- }
--
return {}
