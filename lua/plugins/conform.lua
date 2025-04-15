return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Extend the default formatter config safely
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
    })

    -- ✅ Add :Format command, safely
    vim.api.nvim_create_user_command("Format", function()
      require("conform").format({ lsp_fallback = true })
    end, {})

    return opts
  end,
}
