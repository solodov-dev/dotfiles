[[:hrsh7th/cmp-nvim-lsp]
 [:hrsh7th/cmp-buffer]
 [:hrsh7th/cmp-path]
 [:hrsh7th/cmp-cmdline]
 [:saadparwaiz1/cmp_luasnip]
 {1 :L3MON4D3/LuaSnip :dependencies [:rafamadriz/friendly-snippets]}
 {1 :hrsh7th/nvim-cmp
  :dependencies [:onsails/lspkind.nvim]
  :config (fn []
            (let [cmp (require :cmp)
                  lspkind (require :lspkind)
                  lkind (lspkind.cmp_format {:mode :symbol_text :maxwidth 50})
                  luasnip (require :luasnip)
                  friendly_snippets (require :luasnip.loaders.from_vscode)]
              (cmp.setup {:snippet {:expand (fn [args]
                                              (luasnip.lsp_expand args.body))}
                          :mapping {:<C-p> (cmp.mapping.select_prev_item)
                                    :<C-n> (cmp.mapping.select_next_item)
                                    :<C-b> (cmp.mapping.scroll_docs (- 4))
                                    :<C-f> (cmp.mapping.scroll_docs 4)
                                    :<C-Space> (cmp.mapping.complete)
                                    :<C-e> (cmp.mapping.close)
                                    :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Insert
                                                                :select true})}
                          :window {:documentation (cmp.config.window.bordered)
                                   :completion (cmp.config.window.bordered)}
                          :formatting {:fields [:kind :abbr :menu]
                                       :format (fn [entry item]
                                                 (let [kind (lkind entry item)
                                                       strings (vim.split kind.kind
                                                                          "%s"
                                                                          {:trimepty true})]
                                                   (set kind.kind
                                                        (.. " "
                                                            (or (. strings 1)
                                                                "")
                                                            " "))
                                                   (set kind.menu
                                                        (.. " "
                                                            (or (. strings 2)
                                                                "")
                                                            " "))
                                                   kind))}
                          :sources [{:name :nvim_lsp}
                                    {:name :luasnip
                                     :group_index 1
                                     :option {:use_show_condition true}
                                     :entry_filter (fn []
                                                     (let [context (require :cmp.config.context)]
                                                       (and (not (context.in_treesitter_capture :string))
                                                            (not (context.in_syntax_group :String)))))}
                                    {:name :buffer}
                                    {:name :conjure}]})
              (cmp.setup.cmdline ["/" "?"]
                                 {:mapping (cmp.mapping.preset.cmdline)
                                  :sources {:name :buffer}})
              (cmp.setup.cmdline [":"]
                                 {:mapping (cmp.mapping.preset.cmdline)
                                  :sources (cmp.config.sources [{:name :path}]
                                                               [{:name :cmdline}])})
              (friendly_snippets.lazy_load)))}]
