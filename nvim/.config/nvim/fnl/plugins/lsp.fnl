[{1 :williamboman/mason.nvim}
 {1 :williamboman/mason-lspconfig.nvim}
 {1 :neovim/nvim-lspconfig
  :config (fn []
            (let [mason (require :mason)
                  mason_lsp (require :mason-lspconfig)
                  lspconfig (require :lspconfig)
                  cmp_lsp (require :cmp_nvim_lsp)]
              (mason.setup {})
              (mason_lsp.setup {:ensure_installed [:awk_ls
                                                   :bashls
                                                   :clangd
                                                   :cssls
                                                   :cssmodules_ls
                                                   :docker_compose_language_service
                                                   :dockerls
                                                   :emmet_ls
                                                   :eslint
                                                   :jsonls
                                                   :lua_ls
                                                   :marksman
                                                   :rust_analyzer
                                                   :ts_ls
                                                   :yamlls
                                                   :clojure_lsp
                                                   :fennel_language_server]
                                :handlers [(fn [server_name]
                                             (let [capabilities (cmp_lsp.default_capabilities)
                                                   server (. lspconfig
                                                             server_name)]
                                               (server.setup [capabilities])))]})))}]

