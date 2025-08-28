return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        filetypes = {
          lua = true,
          typescript = true,
          javascript = true,
          python = true,
          markdown = false,
          text = false,
          gitcommit = false,
        },
        disable_inline_suggestions_in_comments = true,
      })
    end,
  },
}
