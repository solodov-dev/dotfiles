[{1 :nvim-treesitter/nvim-treesitter
  :build ":TSUpdate"
  :config (fn []
            (let [ts (require :nvim-treesitter.configs)]
              (ts.setup {:highlight {:enable true}
                         :indent {:enable true}
                         :ensure_installed [:rust
                                            :lua
                                            :fennel
                                            :vim
                                            :vimdoc
                                            :query
                                            :css
                                            :javascript
                                            :html
                                            :typescript
                                            :markdown
                                            :bash
                                            :tsx
                                            :clojure
                                            :dockerfile
                                            :yaml
                                            :java]})))}]
