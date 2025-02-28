return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          extra_filetypes = { "java" },
          extra_args = { "--plugin=prettier-plugin-java", "--config", ".prettierrc" },
        }),
      },
    })
  end,
}
