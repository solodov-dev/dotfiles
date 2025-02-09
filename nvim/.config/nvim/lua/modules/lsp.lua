return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
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
            local capabilities = require('blink.cmp').get_lsp_capabilities()
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
          end
        }
      })
    end
  },
}
