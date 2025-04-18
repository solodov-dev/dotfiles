[{1 :nvim-lualine/lualine.nvim
  :name :lualine
  :dependencies [:nvim-tree/nvim-web-devicons]
  :config (fn []
            (let [lualine (require :lualine)]
              (lualine.setup {:options {:theme :auto}})))}]
