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

return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "omnisharp" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          -- optional: fix path if you're using global install or custom mason install
          -- cmd = { "/path/to/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    },
  },
}
