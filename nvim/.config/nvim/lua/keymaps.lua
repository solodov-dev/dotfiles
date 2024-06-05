-- Keymaps

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line up
vim.keymap.set("n", "J", "mzJ`z") -- connect line without moving the coursor


function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
		config = function()
			require("which-key").register({
				f = {
					name = "File",
					f = { "<cmd>Telescope find_files<cr>", "Find File (all)" },
					g = { "<cmd>Telescope git_files<cr>", "Git Files" },
					r = { "<cmd>Telescope live_grep<cr>", "Live grep" },
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },
					u = { "<cmd>Telescope undo<cr>", "Undo tree" },
					h = { "<cmd>Telescope oldfiles<cr>", "History" },
					o = { "<cmd>Oil<cr>", "Oil (edit files as buffer)" },
					e = { vim.cmd.Ex, "File explorer" },
				},
				g = {
					name = "Git",
					g = { "<cmd>Neogit<cr>", "Git" },
				},
				l = {
					name = "LSP",
					I = { "<cmd>Mason<cr>", "Install" },
					d = { vim.lsp.buf.definition, "Definiion" },
					i = { vim.lsp.buf.implementation, "Implementation" },
					h = { vim.lsp.buf.hover, "Signature" },
					a = { vim.lsp.buf.code_action, "Actions" },
					r = { vim.lsp.buf.references, "References" },
					R = { vim.lsp.buf.rename, "Rename" },
					f = {
						function()
							require("conform").format({ async = true, lsp_fallback = true })
						end,
						"Format",
					},
				},
				d = {
					name = "Diagnostics",
					h = { vim.diagnostic.open_float, "Open highlighted" },
					n = { vim.diagnostic.goto_next, "Next" },
					p = { vim.diagnostic.goto_prev, "Previous" },
					w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace" },
					d = { "<cmd>Trouble document_diagnostics<cr>", "Document" },
					q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
					l = { "<cmd>Trouble loclist<cr>", "Loclist" },
				},
				t = {
					name = "Terminal",
					t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle" },
					v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
					h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal" },
					g = { "<cmd>lua _lazygit_toggle()<cr>", "Git" },
					y = { "<cmd>lua _yarn_toggle()<cr>", "Yarn start" },
				},
				p = { '"_dP', "Paste (delete to void)" },
				v = {
					function()
						vim.cmd.edit("~/.config/nvim/init.lua")
					end,
					"Edit config",
				},
				S = {
					function()
						vim.cmd.edit("/tmp/scratch.md")
					end,
					"Scratchpad",
				},
				m = {
					name = "Markdown",
					t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle preview" },
				},
				b = {
					name = "Debugger",
					b = { "<cmd>DapToggleBreakpoint<cr>", "Add breakpoint" },
					r = { "<cmd>DapContinue<cr>", "Start or continue debugger" },
				},
			}, { prefix = "<leader>" })
		end,
	},
}

