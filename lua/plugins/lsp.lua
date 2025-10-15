return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -------------------------------------------------------------
      -- 1.  Get capabilities safely, fallback to default if Blink not available
      -------------------------------------------------------------
      local capabilities
      local ok, blink = pcall(require, "blink.cmp")
      if ok and blink then
        capabilities = blink.get_lsp_capabilities()
      else
        -- Fallback to default capabilities if Blink is not available
        capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        capabilities.textDocument.completion.completionItem.resolveSupport = {
          properties = { "documentation", "detail", "additionalTextEdits" },
        }
      end

      -------------------------------------------------------------
      -- 2.  Enhanced OmniSharp setup for .NET development
      -------------------------------------------------------------
      opts.servers = opts.servers or {}
      opts.servers.omnisharp = vim.tbl_deep_extend("force", opts.servers.omnisharp or {}, {
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = true,
        capabilities = capabilities,
        settings = {
          OmniSharp = {
            useModernNet = true,
            enableEditorConfigSupport = true,
            enableImportCompletion = true,
            enableRoslynAnalyzers = true,
            organizeImportsOnFormat = true,
            enableMsBuildLoadProjectsOnDemand = true,
            msBuild = {
              loadProjectsOnDemand = true,
            },
            roslynExtensionsOptions = {
              enableAnalyzersSupport = true,
              enableDecompilationSupport = true,
              enableImportCompletion = true,
            },
            formattingOptions = {
              enableEditorConfigSupport = true,
              organizeImports = true,
            },
          },
        },
        on_attach = function(client)
          -- Disable inlay hints to prevent crashes
          if client.server_capabilities.inlayHintProvider then
            client.server_capabilities.inlayHintProvider = false
          end
          
          -- Enable document formatting on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = 0,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      })

      -------------------------------------------------------------
      -- 3.  Add tsserver configuration
      -------------------------------------------------------------
      opts.servers.tsserver = {
        capabilities = capabilities,
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
          javascript = {
            preferences = {
              importModuleSpecifier = "non-relative",
            },
          },
        },
      }
    end,
  },
}
