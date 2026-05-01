return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
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
      "rust_analyzer",
      "ts_ls",
      "yamlls",
      "clojure_lsp",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
