return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "awk_ls",
          "bashls",
          "clangd",
          "cssls",
          "cssmodules_ls",
          "docker_compose_language_service",
          "dockerls",
          "emmet_ls",
          "eslint",
          "jsonls",
          "lua_ls",
          "marksman",
          "rust_analyzer",
          "ts_ls",
          "yamlls",
        },
        handlers = {
          -- Default setup handler for all servers
          function(server_name)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")[server_name].setup({ capabilities })
          end,

          -- Custom handlers for specific languages
          rust_analyzer = function()
            require("lspconfig").rust_analyzer.setup({
              assist = {
                importEnforceGranularity = true,
                importPrefix = "crate",
              },
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              diagnostics = {
                enable = true,
                experimental = {
                  enable = true,
                },
              },
            })
          end,

          cssls = function()
            --Enable (broadcasting) snippet capability for completion
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            require 'lspconfig'.cssls.setup {
              capabilities = capabilities,
            }
          end,

          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                  },
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {
                      "vim",
                      "require",
                    },
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                  -- Do not send telemetry data containing a randomized but unique identifier
                  telemetry = {
                    enable = false,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
