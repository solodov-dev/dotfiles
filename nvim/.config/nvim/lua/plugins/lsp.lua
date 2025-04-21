-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local mason = require("mason")
  local mason_lsp = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local cmp_lsp = require("cmp_nvim_lsp")
  mason.setup({})
  local function _2_(server_name)
    local capabilities = cmp_lsp.default_capabilities()
    local server = lspconfig[server_name]
    return server.setup({capabilities})
  end
  return mason_lsp.setup({ensure_installed = {"awk_ls", "bashls", "clangd", "cssls", "cssmodules_ls", "docker_compose_language_service", "dockerls", "emmet_ls", "eslint", "jsonls", "lua_ls", "marksman", "rust_analyzer", "ts_ls", "yamlls", "clojure_lsp", "fennel_language_server"}, handlers = {_2_}})
end
return {{"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"}, {"neovim/nvim-lspconfig", config = _1_}}
