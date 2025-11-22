return {
  { "williamboman/mason.nvim",           version = "^1.0.0" },
  { "williamboman/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      mason.setup({})
      return mason_lspconfig.setup({
        ensure_installed = {
          "awk_ls",
          "bashls",
          "clangd",
          "gopls",
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
          function(server_name)
            local capabilities = cmp_nvim_lsp.default_capabilities()
            vim.lsp.enable(server_name)
            vim.lsp.config(server_name, capabilities)
          end,
        },
      })
    end,
  },
}
