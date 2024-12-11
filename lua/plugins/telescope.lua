return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      -- Load live_grep_args extension
      require("telescope").load_extension("live_grep_args")

      -- Telescope setup
      require("telescope").setup({
        defaults = {
          cwd = vim.fn.getcwd(), -- Respect the terminal's current working directory
          mappings = {
            i = {
              -- Remap in insert mode
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-n>"] = false, -- Optionally remove default mapping
              ["<C-p>"] = false,
            },
            n = {
              -- Remap in normal mode
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>/",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args({
            cwd = vim.fn.getcwd(), -- Explicitly set the working directory
          })
        end,
        desc = "Live grep with args in current directory",
      },
      {
        "<leader><space>",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.getcwd(), -- Explicitly set the working directory
          })
        end,
        desc = "Find files in current directory",
      },
    },
  },
}
--   },
