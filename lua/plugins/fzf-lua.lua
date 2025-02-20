return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      cwd = vim.fn.getcwd(),                                                                                  -- Ensure file search is limited to the current directory
      fd_opts = "--hidden --exclude '**/java/org/jooq/**' --exclude '.jhipster/**' --exclude '**/target/**'", -- Ignore jOOQ and JHipster files
    },
    grep = {
      cwd = vim.fn.getcwd(),                                                                                                      -- Ensure grep searches only in the current directory
      rg_opts =
      "--hidden --line-number --column --smart-case --glob '!**/java/org/jooq/**' --glob '!.jhipster/**' --glob '!**/target/**'", -- Ensure line numbers, column info, and ignores
    },
  },
  config = function(_, opts)
    local fzf_lua = require("fzf-lua")

    fzf_lua.setup(opts)

    -- Keymaps for searching in the current directory
    vim.keymap.set("n", "<leader><space>", function()
      fzf_lua.files({ cwd = vim.fn.getcwd() })
    end, { desc = "Find Files in Current Directory" })

    vim.keymap.set("n", "<leader>sw", function()
      fzf_lua.grep_cword({ cwd = vim.fn.getcwd() })
    end, { desc = "Live Grep in Current Directory" })

    vim.keymap.set("n", "<leader>/", function()
      fzf_lua.live_grep({ cwd = vim.fn.getcwd() })
    end, { desc = "Live Grep in Current Directory" })
  end,
}
