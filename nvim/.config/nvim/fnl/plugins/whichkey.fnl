(macro g [key name]
  {1 (.. :<leader> key) :group name})

(macro c [key cmd desc]
  {1 (.. :<leader> key) 2 (.. :<cmd> cmd :<cr>) : desc})

[{1 :folke/which-key.nvim
  :event :VeryLazy
  :config (fn []
            (let [wk (require :which-key)]
              (wk.add [; Actions
                       (g :a :Actions)
                       (c :as :s :ISwap :Swap)
                       ; Search
                       (g :s :Search)
                       (c :sf "Telescope find_files" "Find Files (all)")
                       (c :sr :GrugFar :Replace)
                       (c :sR "Telescope resume" "Resume previous search")
                       (c :st "Telescope lsp_type_definitions"
                          "Type definitions")
                       (c :si "Telescope lsp_implementations" :Implementations)
                       (c :sg "Telescope git_files" "Git Files")
                       (c :ss "Telescope live_grep" :String)
                       (c :sm "Telescope marks" :Marks)
                       (c :sb "Telescope buffers" :Buffers)
                       (c :su "Telescope undo" :Undo)
                       (c :so "Telescope oldfiles" :Oldfiles)
                       (c :sh "Telescope help_tags" :Help)
                       (c :sj "Telescope jumplist" :Jumplist)
                       ; Files
                       (g :f :Files)
                       (c :fo "lua require('oil').open_float()" :Oil)
                       (c :fe :NvimTreeFindFileToggle :Explorer)
                       (c :fd "lua require('dropbar.api').pick()" :Dropbap)
                       ; Tasks
                       (g :t :Tasks)
                       (c :tt :OverseerToggle "Toggle tasks list")
                       (c :tr :OverseerRun "Run task")
                       (c :ti :OverseerInfo :Info)
                       (c :tb :OverseerBuild :Build)
                       ; Git
                       (g :g :Git)
                       (c :gg :Neogit :Git)
                       (c :gb :BlageToggle :Blame)
                       (c :gs "Telescope git_status" :Status)
                       ; QuickFix
                       (g "Quickfix list")
                       (c :ct "Trouble qflist toggle" "Quickfix list (Trouble)")
                       (c :co :copen :Open)
                       (c :cc :cclose :Close)
                       (c :cn :cnext :Next)
                       (c :cp :cprev :Prev)
                       ; Diff
                       (g :D :Diff)
                       (c :Dd :DiffviewOpen "Diff with current Index")
                       (c :Dh "DiffviewFileHistory %" "Diff file history")
                       (c :Dc :DiffviewClose "Close Diffview")
                       ; LSP
                       (g :l :LSP)
                       (c :lI :Mason :Install)
                       (c :ll
                          "Trouble lsp toggle focus=false win.position=right"
                          "LSP definitions / references / ... (Trouble)")
                       (c :ld "lua vim.lsp.buf.definition()" :Definiion)
                       (c :li "lua vim.lsp.buf.implementation()"
                          :Implementation)
                       (c :lh "lua vim.lsp.buf.hover()" :Signature)
                       (c :la "lua vim.lsp.buf.code_action()" :Actions)
                       (c :lr "lua vim.lsp.buf.references()" :References)
                       (c :lR "lua vim.lsp.buf.rename()" :Rename)
                       (c :lf
                          "lua require('conform').format(( async = true, lsp_fallback = true ))"
                          :Format)
                       ; Diagnostics
                       (g :d :Diagnostics)
                       (c :dt "Trouble diagnostics toggle" :Trouble)
                       (c :dT "Trouble diagnostics toggle filter.buf=0"
                          "Trouble (current file)")
                       (c :ds "Trouble symbols toggle focus=false" :Symbols)
                       (c :dh "lua vim.diagnostic.open_float()"
                          "Open highlighted")
                       (c :dn "lua vim.diagnostic.goto_next()" :Next)
                       (c :dp "lua vim.diagnostic.goto_prev()" :Previous)
                       ; Buffers
                       (g :b :Buffers)
                       (c :bz :ZenMode :Zen)
                       ; DAP
                       (g :B :Debug)
                       (c :Bb :DapToggleBreakpoint :Breakpoint)
                       (c :Bs :DapContinue :Start/Continue)
                       ; Config
                       (c :v "e ~/.config/nvim" "Edit config")])))}]
