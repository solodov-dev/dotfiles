[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/plenary.nvim
                 :debugloop/telescope-undo.nvim]
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)]
              (telescope.setup {:extentions {:undo {}
                                             :fzf {:override_generic_sorter true
                                                   :override_file_sorter true}}
                                :defaults (themes.get_ivy {})
                                :pickers {:find_files {:hidden true}}})
              (telescope.load_extension :undo)
              (telescope.load_extension :fzf)
              (telescope.load_extension :ui-select)))}
 {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}]
