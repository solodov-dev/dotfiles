(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))

(let [options {:tabstop 2
               :shiftwidth 2
               :expandtab true
               :softtabstop 2
               :nu true
               :relativenumber true
               :smartindent true
               :wrap false
               :hlsearch true
               :incsearch true
               :termguicolors true
               :scrolloff 8
               :signcolumn :yes
               :updatetime 50
               :colorcolumn :80
               :clipboard :unnamedplus}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))

{}
