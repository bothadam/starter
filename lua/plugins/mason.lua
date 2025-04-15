return {}

-- return {
--   {
--     "williamboman/mason.nvim",
--     build = ":MasonUpdate", -- Automatically update Mason tools
--     config = function()
--       require("mason").setup()
--     end,
--   },
--   {
--     "williamboman/mason-lspconfig.nvim",
--     opts = {
--       ensure_installed = { "lua_ls", "jdtls", "clangd" }, -- Add servers you want Mason to manage
--     },
--   },
-- }
