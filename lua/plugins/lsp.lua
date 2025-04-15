return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig").util.root_pattern("pom.xml", "build.gradle"),
        single_file_support = true,
      },
    },
  },
}
