[{1 :stevearc/conform.nvim
  :config (fn []
            (let [conform (require :conform)]
              (conform.setup {:formatters_by_ft {:lua [:stylua]
                                                 :python [:isort :black]
                                                 :javascript {1 :prettierd
                                                              2 :prettier
                                                              :stop_after_first true}
                                                 :javascriptreact {1 :prettierd
                                                                   2 :prettier
                                                                   :stop_after_first true}
                                                 :typescriptreact {1 :prettierd
                                                                   2 :prettier
                                                                   :stop_after_first true}
                                                 :html {1 :prettierd
                                                        2 :prettier
                                                        :stop_after_first true}
                                                 :css {1 :prettierd
                                                       2 :prettier
                                                       :stop_after_first true}
                                                 :json {1 :prettierd
                                                        2 :prettier
                                                        :stop_after_first true}
                                                 :markdown {1 :prettierd
                                                            2 :prettier
                                                            :stop_after_first true}
                                                 :graphql {1 :prettierd
                                                           2 :prettier
                                                           :stop_after_first true}
                                                 :svelte {1 :prettierd
                                                          2 :prettier
                                                          :stop_after_first true}
                                                 :rust {1 :rustfmt
                                                        :lsp_format :fallback}
                                                 :fennel [:fnlfmt]}
                              :format_on_save {:timeout_ms 2500
                                               :lsp_fallback true}})))}]
