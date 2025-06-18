return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -------------------------------------------------------------
      -- 1.  Use Blink’s helper for capabilities
      -------------------------------------------------------------
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -------------------------------------------------------------
      -- 2.  Standard OmniSharp setup + the inlay-hint crash guard
      -------------------------------------------------------------
      opts.servers = opts.servers or {}
      opts.servers.omnisharp = vim.tbl_deep_extend("force", opts.servers.omnisharp or {}, {
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        capabilities = capabilities,
        on_attach = function(client)
          -- 🔧 work-around for the ArgumentOutOfRangeException
          if client.server_capabilities.inlayHintProvider then
            client.server_capabilities.inlayHintProvider = false
          end
        end,
      })
    end,
  },
}
