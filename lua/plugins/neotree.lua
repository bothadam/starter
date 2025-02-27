return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,          -- Show hidden files by default
          hide_dotfiles = false,   -- Do not hide dotfiles
          hide_gitignored = false, -- Do not hide .gitignored files
          hide_by_name = {},       -- Do not hide specific file names
        },
      },
    },
  },
}

