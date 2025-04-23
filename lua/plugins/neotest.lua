return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/nvim-nio", -- ✅ Add this line
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vim-test")({
          ignore_file_types = {}, -- Allow all file types including dotnet
        }),
      },
    })

    local neotest = require("neotest")

    vim.keymap.set("n", "<leader>tt", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run all tests in file" })

    vim.keymap.set("n", "<leader>tl", function()
      neotest.run.run_last()
    end, { desc = "Run last test" })

    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Toggle test summary" })

    vim.keymap.set("n", "<leader>to", function()
      neotest.output.open({ enter = true })
    end, { desc = "Show test output" })
  end,
}
