[{1 :stevearc/oil.nvim
  :dependencies :nvim-tree/nvim-web-devicons
  :config (fn []
            (let [oil (require :oil)]
              (oil.setup {:watch_for_changes true
                          :lsp_file_methods {:enabled true
                                             :autosave_changes true}
                          :view_options {:show_hidden true}})))}]
