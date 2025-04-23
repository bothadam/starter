return {
  -- Neotest for test running framework
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet", -- .NET test adapter
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-dotnet")({
            -- Optional custom discovery for test projects
            discovery_root = "solution", -- or "project" or "directory"
            -- Optional custom args for dotnet test
            dap = { justMyCode = true }, -- Configure debugger options
            -- Test output format
            -- Available values: "classic", "diagnostic", "json"
            test_output_format = "diagnostic",
          }),
        },
      })

      -- Key mappings for running tests
      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run()
      end, { desc = "Run nearest test" })

      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, { desc = "Run tests in file" })

      vim.keymap.set("n", "<leader>ts", function()
        neotest.summary.toggle()
      end, { desc = "Toggle test summary" })

      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({ enter = true })
      end, { desc = "Show test output" })

      vim.keymap.set("n", "<leader>tl", function()
        neotest.run.run_last()
      end, { desc = "Run last test" })

      vim.keymap.set("n", "<leader>td", function()
        neotest.run.run({ strategy = "dap" })
      end, { desc = "Debug nearest test" })
    end,
  },

  -- Optional: DAP for debugging tests
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")

      -- Set up netcoredbg adapter for .NET debugging
      dap.adapters.netcoredbg = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      }

      -- Configure .NET debugging
      dap.configurations.cs = {
        {
          type = "netcoredbg",
          name = "Launch .NET Core Application",
          request = "launch",
          program = function()
            return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
          end,
        },
      }
    end,
  },
}
