return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jdtls = {
        on_attach = function(client, bufnr)
          -- Disable formatting for LSP
          client.server_capabilities.documentFormattingProvider = false
        end,

        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xms2g",
          "-Xmx4G",
          "-javaagent:/Users/adambotha/.m2/repository/org/projectlombok/lombok/1.18.32/lombok-1.18.32.jar",
          "-jar",
          "/Users/adambotha/repositories/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
          "-configuration",
          "/Users/adambotha/repositories/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_mac", -- Adjust for your OS (config_mac, config_linux, etc.)
          "-data",
          "/Users/adambotha/java-workspace",
        },
        root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
        settings = {
          java = {
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            format = {
              enabled = false,
            },
            contentProvider = { preferred = "fernflower" },
            autobuild = {
              enabled = false, -- Avoid automatic build triggering
            },
            import = {
              exclusions = {
                "**/src/main/java/org/jooq/**", -- Exclude large directories
              },
            },
            completion = {
              favoriteStaticMembers = {
                "org.junit.Assert.*",
                "org.mockito.Mockito.*",
                "org.mockito.ArgumentMatchers.*",
                "org.mockito.Answers.*",
              },
            },
          },
        },
        init_options = {
          bundles = {},
        },
      },
      clangd = {
        cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig.util").root_pattern(".git", "."),
        single_file_support = true,
      },
    },
  },
}
